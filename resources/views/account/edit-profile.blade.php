@extends('layouts.account')

@section('content')
<div class="account-layout  border">
    <div class="account-hdr bg-primary text-white border">
        Update Profile
    </div>
    <div class="account-bdy p-3">
        <form action="{{route('account.editProfile')}}" enctype="multipart/form-data" method="POST">
            @csrf


            @method('PUT')

            <div class="form-group">
                <label for="first_name">First Name</label>
                <input id="first_name" type="text" class="form-control @error('first_name') is-invalid @enderror" name="first_name" value="{{ old('first_name', $user->first_name) }}" required autofocus>
                @error('first_name')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="middle_name">Middle Name</label>
                <input id="middle_name" type="text" class="form-control @error('middle_name') is-invalid @enderror" name="middle_name" value="{{ old('middle_name', $user->middle_name) }}">
                @error('middle_name')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="last_name">Last Name</label>
                <input id="last_name" type="text" class="form-control @error('last_name') is-invalid @enderror" name="last_name" value="{{ old('last_name', $user->last_name) }}" required>
                @error('last_name')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email', $user->email) }}" required>
                @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="phone_number">Phone Number</label>
                <input id="phone_number" type="text" class="form-control @error('phone_number') is-invalid @enderror" name="phone_number" value="{{ old('phone_number', $user->phone_number) }}" required>
                @error('phone_number')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="country">Country</label>
                <input id="country" type="text" class="form-control @error('country') is-invalid @enderror" name="country" value="{{ old('country', $user->country) }}">
                @error('country')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="city_region">City/Region</label>
                <input id="city_region" type="text" class="form-control @error('city_region') is-invalid @enderror" name="city_region" value="{{ old('city_region', $user->city_region) }}">
                @error('city_region')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="physical_address">Physical Address</label>
                <input id="physical_address" type="text" class="form-control @error('physical_address') is-invalid @enderror" name="physical_address" value="{{ old('physical_address', $user->physical_address) }}">
                @error('physical_address')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="date_of_birth">Date of Birth</label>
                <input id="date_of_birth" type="date" class="form-control @error('date_of_birth') is-invalid @enderror" name="date_of_birth" value="{{ old('date_of_birth', $user->date_of_birth ? $user->date_of_birth->format('Y-m-d') : '') }}">
                @error('date_of_birth')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="profile_picture">Profile Picture</label>
                <input id="profile_picture" type="file" class="form-control-file @error('profile_picture') is-invalid @enderror" name="profile_picture">
                @error('profile_picture')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>



            {{-- added --}}
          
            <div class="line-divider"></div>
            <div class="mt-3">
                <button type="submit" class="btn primary-btn">Update Profile</button>
                <button class="btn primary-outline-btn">Cancel</button>
            </div>
        </form>
    </div>
</div>
@endSection

@push('css')

@endpush
