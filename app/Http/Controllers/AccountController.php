<?php

namespace App\Http\Controllers;

use App\Models\JobApplication;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;

class AccountController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        return view('account.user-account');
    }

    public function becomeEmployerView()
    {
        return view('account.become-employer');
    }

    public function becomeEmployer()
    {
        $user = User::find(auth()->user()->id);
        $user->removeRole('user');
        $user->assignRole('author');
        return redirect()->route('account.authorSection');
    }

    public function applyJobView(Request $request)
    {
        if ($this->hasApplied(auth()->user(), $request->post_id)) {
            Alert::toast('You have already applied for this job!', 'success');
            return redirect()->route('post.show', ['job' => $request->post_id]);
        }else if(!auth()->user()->hasRole('user')){
            Alert::toast('You are a employer! You can\'t apply for the job! ', 'error');
            return redirect()->route('post.show', ['job' => $request->post_id]);
        }

        $post = Post::find($request->post_id);
        $company = $post->company()->first();
        return view('account.apply-job', compact('post', 'company'));
    }

    public function applyJob(Request $request)
    {
        $application = new JobApplication;
        $user = User::find(auth()->user()->id);

        if ($this->hasApplied($user, $request->post_id)) {
            Alert::toast('You have already applied for this job!', 'success');
            return redirect()->route('post.show', ['job' => $request->post_id]);
        }

        $application->user_id = auth()->user()->id;
        $application->post_id = $request->post_id;
        $application->save();
        Alert::toast('Thank you for applying! Wait for the company to respond!', 'success');
        return redirect()->route('post.show', ['job' => $request->post_id]);
    }

    public function changePasswordView()
    {

       
    
        return view('account.change-password');
    }


    

    public function changePassword(Request $request)
    {
        if (!auth()->user()) {
            Alert::toast('Not authenticated!', 'success');
            return redirect()->back();
        }

        //check if the password is valid
        $request->validate([
            'current_password' => 'required|min:8',
            'new_password' => 'required|min:8'
        ]);

        $authUser = auth()->user();
        $currentP = $request->current_password;
        $newP = $request->new_password;
        $confirmP = $request->confirm_password;

        if (Hash::check($currentP, $authUser->password)) {
            if (Str::of($newP)->exactly($confirmP)) {
                $user = User::find($authUser->id);
                $user->password = Hash::make($newP);
                if ($user->save()) {
                    Alert::toast('Password Changed!', 'success');
                    return redirect()->route('account.index');
                } else {
                    Alert::toast('Something went wrong!', 'warning');
                }
            } else {
                Alert::toast('Passwords do not match!', 'info');
            }
        } else {
            Alert::toast('Incorrect Password!', 'info');
        }
        return redirect()->back();
    }


    public function editProfileView()
    {

       
        $user = auth()->user(); // Retrieve the authenticated user
        return view('account.edit-profile', compact('user'));
    }



    public function editProfile(Request $request)
    {
        if (!auth()->user()) {
            Alert::toast('Not authenticated!', 'success');
            return redirect()->back();
        }

        //check if the password is valid
        $request->validate([
           
            'first_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . auth()->user()->id,
            'phone_number' => 'required|string|max:20|unique:users,phone_number,' . auth()->user()->id,
            'country' => 'nullable|string|max:255',
            'city_region' => 'nullable|string|max:255',
            'physical_address' => 'nullable|string|max:255',
            'date_of_birth' => 'nullable|date',
            'profile_picture' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
    
        // Fetch the authenticated user
        $authUser = auth()->user();
    
        
         
            // Update other profile fields
            $authUser->first_name = $request->first_name;
            $authUser->middle_name = $request->middle_name;
            $authUser->last_name = $request->last_name;
            $authUser->email = $request->email;
            $authUser->phone_number = $request->phone_number;
            $authUser->country = $request->country;
            $authUser->city_region = $request->city_region;
            $authUser->physical_address = $request->physical_address;
            $authUser->date_of_birth = $request->date_of_birth;
    
            // Handle profile picture upload if provided
            if ($request->hasFile('profile_picture')) {
                $image = $request->file('profile_picture');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('profile_images'), $imageName);
                $authUser->profile_picture = 'profile_images/' . $imageName;
            }
    
            // Save the updated user data
            if ($authUser->save()) {
                Alert::toast('Profile updated successfully!', 'success');
                return redirect()->route('account.index');
            } else {
                Alert::toast('Failed to update profile!', 'warning');
            }
    
      
        
    
        return redirect()->back();
    }


    public function deactivateView()
    {
        return view('account.deactivate');
    }

    public function deleteAccount()
    {
        $user = User::find(auth()->user()->id);
        Auth::logout($user->id);
        if ($user->delete()) {
            Alert::toast('Your account was deleted successfully!', 'info');
            return redirect(route('post.index'));
        } else {
            return view('account.deactivate');
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('login');
    }

    protected function hasApplied($user, $postId)
    {
        $applied = $user->applied()->where('post_id', $postId)->get();
        if ($applied->count()) {
            return true;
        } else {
            return false;
        }
    }
}
