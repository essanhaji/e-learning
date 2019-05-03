<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//----------------------------------->>>>>> Student
///////////////////////////////////////////////////
Route::get('/student', 'HomeController@indexStudent');




//----------------------------------->>>>>> Teacher
///////////////////////////////////////////////////
Route::get('/teacher', 'HomeController@indexTeacher');




//----------------------------------->>>>>> Admin
///////////////////////////////////////////////////
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});




//----------------------------------->>>>>> Home
///////////////////////////////////////////////////

Auth::routes();
Route::get('/userhaslogin', 'HomeController@userHasLogin');

#.... index
Route::get('/', 'HomeIndexController@index');
Route::post('home/newsletter', 'HomeIndexController@newsletter');
Route::post('home/footerFormContact', 'HomeIndexController@footerFormContact');

#.... courses
Route::post('courses', 'HomeCoursesController@index4');//search
Route::get('courses', 'HomeCoursesController@index1');
Route::get('courses/category/{slug}', 'HomeCoursesController@index2');
Route::get('courses/teacher/{slug}', 'HomeCoursesController@index3');

#.... Cours single
Route::get('courses/{slug}', 'HomeSinglCoursController@index');
Route::post('courses/cours-single/addquestion', 'HomeSinglCoursController@addQuestion');
Route::get('courses/comments/getcomment/{id}', 'HomeSinglCoursController@getComment');


#.... All teachers
Route::get('teachers/{search?}/{key?}', 'HomeTeachersController@index');

#.... teacher profile
Route::get('teachers/{slug}', 'HomeTeacherProfileController@index');

#.... single post
Route::get('blog/{slug}', 'HomeSinglePoseController@index');

#.... blog all posts
Route::get('blog/{category?}/{slug?}', 'HomeBlogController@index');

