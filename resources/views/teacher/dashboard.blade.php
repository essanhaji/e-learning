@extends('teacher.layout')
@section('content')

<!-- ============================================================== -->
<!-- Page Content -->
<!-- ============================================================== -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Dashboard</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/teacher') }}">Dashboard</a></li>
                    <li class="active"></li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <!-- ============================================================== -->
        <!-- Different data widgets -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <div class="row row-in">
                        <div class="col-lg-3 col-sm-6 row-in-br">
                            <ul class="col-in">
                                <li>
                                    <span class="circle circle-md bg-danger"><i class="ti-wallet"></i></span>
                                </li>
                                <li class="col-last">
                                    <h3 class="counter text-right m-t-15">{{ $totalMyCourses }}</h3>
                                </li>
                                <li class="col-middle">
                                    <h4>Total Courses</h4>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="{{ ($totalMyCourses * 100)/$totalCourses }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ ($totalMyCourses * 100)/$totalCourses }}%"></div>
                                    </div>
                                    
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-sm-6 row-in-br  b-r-none">
                            <ul class="col-in">
                                <li>
                                    <span class="circle circle-md bg-info"><i class="ti-user"></i></span>
                                </li>
                                <li class="col-last">
                                    <h3 class="counter text-right m-t-15">{{ $totalMyStudents }}</h3>
                                </li>
                                <li class="col-middle">
                                    <h4>Total Students</h4>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="{{ ($totalMyStudents * 100)/$totalStudents }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ ($totalMyStudents * 100)/$totalStudents }}%"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-sm-6 row-in-br">
                            <ul class="col-in">
                                <li>
                                    <span class="circle circle-md bg-success"><i class=" ti-clipboard"></i></span>
                                </li>
                                <li class="col-last">
                                    <h3 class="counter text-right m-t-15">{{ $totalMyPosts }}</h3>
                                </li>
                                <li class="col-middle">
                                    <h4>Total Posts</h4>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="{{ ($totalMyPosts * 100)/$totalPosts }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ ($totalMyPosts * 100)/$totalPosts }}%"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-sm-6  b-0">
                            <ul class="col-in">
                                <li>
                                    <span class="circle circle-md bg-warning"><i class="ti-comment"></i></span>
                                </li>
                                <li class="col-last">
                                    <h3 class="counter text-right m-t-15">{{ $totalMyComments }}</h3>
                                </li>
                                <li class="col-middle">
                                    <h4>Total Comments</h4>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="{{ ($totalMyComments * 100)/$totalComments }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ ($totalMyComments * 100)/$totalComments }}%"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--row -->
        <!-- /.row -->
        <div class="row">

            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                <div class="white-box">
                    <h3 class="box-title">subscribers of the best three courses</h3>
                    <ul class="list-inline text-right">
                        <li>
                            <h5><i class="fa fa-circle m-r-5 text-warning"></i>{{ $bestCourses[0]->title }}</h5>
                        </li>
                        <li>
                            <h5><i class="fa fa-circle m-r-5 text-info"></i>{{ $bestCourses[1]->title }}</h5>
                        </li>
                        <li>
                            <h5><i class="fa fa-circle m-r-5 text-danger"></i>{{ $bestCourses[2]->title }}</h5>
                        </li>
                    </ul>
                    <div id="ct-visits" style="height: 285px;"></div>
                </div>
            </div>
            
        </div>

        
        <!-- ============================================================== -->
        <!-- wallet, & manage users widgets -->
        <!-- ============================================================== -->
        <!-- .row -->
        <div class="row">
            <!-- col-md-9 -->
            <div class="col-md-12 col-lg-12">
                <div class="manage-users">
                    <div class="sttabs tabs-style-iconbox">
                        <nav>
                            <ul>
                                <li><a href="#section-iconbox-1" class="sticon ti-wallet"><span>Courses</span></a></li>
                                <li><a href="#section-iconbox-2" class="sticon ti-clipboard"><span>Set Permissions</span></a></li>
                                <li><a href="#section-iconbox-3" class="sticon ti-user"><span>Message Users</span></a></li>
                                <li><a href="#section-iconbox-4" class="sticon ti-check-box"><span>Save and finish</span></a></li>
                            </ul>
                        </nav>
                        <div class="content-wrap">
                            <section id="section-iconbox-1">
                                <div class="p-20 row">
                                    <div class="col-sm-6">
                                        <h3 class="m-t-0">My Courses</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="side-icon-text pull-right">
                                            <li><a data-toggle="modal" data-target=".modalAddCourse"><span class="circle circle-sm bg-success di"><i class="ti-plus"></i></span><span>Add Course</span></a></li>
                                        </ul>
                                        @include('teacher.modalAddCourse')
                                    </div>
                                </div>
                                <div class="table-responsive manage-table">

                                <div class="row">
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <div class="panel">
                                            <div class="table-responsive">
                                                <table class="table table-hover manage-u-table">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 70px;" class="text-center">#</th>
                                                            <th>TITLE/TAG</th>
                                                            <th>PRICE/LOCATION</th>
                                                            <th>LEVEL/DURATION</th>
                                                            <th>IMAGE</th>
                                                            <th>LANGUAGE/CATEGORY</th>
                                                            <th>ACTION</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach($myCourses as $myCourse)
                                                        <tr>
                                                            <td class="text-center">{{ $myCourse->id }}</td>

                                                            <td>
                                                                <span class="font-medium">{{ $myCourse->title }}</span>
                                                                <br><span class="text-muted">{{ $myCourse->tag }}</span>
                                                            </td>

                                                            <td>
                                                                @if($myCourse->price == 0)
                                                                    <span class="badge badge-warning">Free</span>
                                                                @else
                                                                <span class="badge badge-primary" style="background-color: #2cabe3 !important">{{ $myCourse->price }} DH</span>
                                                                @endif
                                                                <br>
                                                                <span class="text-muted">{{ $myCourse->location }}</span>
                                                            </td>

                                                            <td>
                                                                {{ $myCourse->level }}
                                                                <br>
                                                                <span class="text-muted">{{ $myCourse->duration }} Hour</span>
                                                            </td>

                                                            <td>
                                                                <img src="{{ asset('storage/'.$myCourse->image ) }}" alt="{{ $myCourse->title }}" width="70px">
                                                            </td>

                                                            <td>
                                                                {{ $myCourse->language }}
                                                                <br>
                                                                <span class="text-muted">{{ $myCourse->category->name }}</span>
                                                            </td>

                                                            <td>
                                                                <button type="button" class="btn btn-info btn-outline btn-circle btn-lg m-r-5">
                                                                    <i class="icon-trash"></i>
                                                                </button>
                                                                <button type="button" class="btn btn-info btn-outline btn-circle btn-lg m-r-5">
                                                                    <i class="ti-plus"></i>
                                                                </button>
                                                                <button type="button" class="btn btn-info btn-outline btn-circle btn-lg m-r-5">
                                                                    <i class="ti-pencil-alt"></i>
                                                                </button>
                                                                
                                                            </td>
                                                        </tr>
                                                        @endforeach

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                </div>
                                
                            </section>
                            <section id="section-iconbox-2">
                                <div class="p-20 row">
                                    <div class="col-sm-6">
                                        <h3 class="m-t-0">Set Users Permission</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="side-icon-text pull-right">
                                            <li><a href="#"><span class="circle circle-sm bg-success di"><i class="ti-plus"></i></span><span>Add Users</span></a></li>
                                            <li><a href="#"><span class="circle circle-sm bg-danger di"><i class="ti-pencil-alt"></i></span><span>Edit</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="table-responsive manage-table">
                                    <h1>table of posts</h1>
                                </div>
                                <div class="p-10 row">
                                    <div class="col-sm-8">
                                        <h3>1 members selected</h3>
                                    </div>
                                    <div class="col-sm-2 pull-right m-t-10"><a href="javascript:void(0);" class="btn btn-block p-10 btn-rounded btn-danger"><span>Next</span><i class="ti-arrow-right m-l-5"></i></a></div>
                                </div>
                            </section>
                            <section id="section-iconbox-3">
                                <div class="p-20 row">
                                    <div class="col-sm-6">
                                        <h3 class="m-t-0">Manage Users</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="side-icon-text pull-right">
                                            <li><a href="#"><span class="circle circle-sm bg-success di"><i class="ti-plus"></i></span><span>Add Users</span></a></li>
                                            <li><a href="#"><span class="circle circle-sm bg-danger di"><i class="ti-pencil-alt"></i></span><span>Edit</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="table-responsive manage-table">
                                    <h1>table of oure student</h1>
                                </div>
                                <div class="p-10 row">
                                    <div class="col-sm-8">
                                        <h3>1 members selected</h3>
                                    </div>
                                    <div class="col-sm-2 pull-right m-t-10"><a href="javascript:void(0);" class="btn btn-block p-10 btn-rounded btn-danger"><span>Next</span><i class="ti-arrow-right m-l-5"></i></a></div>
                                </div>
                            </section>
                            <section id="section-iconbox-4">
                                <div class="p-20 row">
                                    <div class="col-sm-6">
                                        <h3 class="m-t-0">Save and finish</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="side-icon-text pull-right">
                                            <li><a href="#"><span class="circle circle-sm bg-success di"><i class="ti-plus"></i></span><span>Add Users</span></a></li>
                                            <li><a href="#"><span class="circle circle-sm bg-danger di"><i class="ti-pencil-alt"></i></span><span>Edit</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="table-responsive manage-table">
                                    <h1>table of sommething</h1>
                                </div>
                                <div class="p-10 row">
                                    <div class="col-sm-8">
                                        <h3>1 members selected</h3>
                                    </div>
                                    <div class="col-sm-2 pull-right m-t-10"><a href="javascript:void(0);" class="btn btn-block p-10 btn-rounded btn-danger"><span>Save</span><i class="ti-arrow-right m-l-5"></i></a></div>
                                </div>
                            </section>
                        </div>
                        <!-- /content -->
                    </div>
                    <!-- /tabs -->
                </div>
            </div>
            <!-- /col-md-9 -->
        </div>
        <!-- /.row -->
        <!-- ============================================================== -->
        <!-- Profile, & inbox widgets -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- calendar & todo list widgets -->
        <!-- ============================================================== -->
        <div class="row">

            <div class="col-md-12 col-lg-12 col-sm-12 m-b-30">
                <div id="calendar"></div>
            </div>
            <!-- BEGIN MODAL -->
            <div class="modal fade none-border" id="my-event">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><strong>Add Event</strong></h4>
                        </div>
                        <div class="modal-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                            <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Add Category -->
            <div class="modal fade none-border" id="add-new-event">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><strong>Add</strong> a category</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">Category Name</label>
                                        <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Choose Category Color</label>
                                        <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                            <option value="success">Success</option>
                                            <option value="danger">Danger</option>
                                            <option value="info">Info</option>
                                            <option value="primary">Primary</option>
                                            <option value="warning">Warning</option>
                                            <option value="inverse">Inverse</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                            <button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MODAL -->
        </div>

        <script>
                $('#summernote').summernote({
                    placeholder: 'Description of the course ...',
                    tabsize: 2,
                    height: 200
                });
        </script>
        @endsection

        @section('js')
            <script>
                $(document).ready(function () {
                "use strict";
                 //ct-visits
                new Chartist.Line('#ct-visits', {
                    labels:  {!! $axsDate !!},
                    series: [{!! $axsSessions !!}]
                }, {
                    top: 0,

                    low: -0.5,
                    showPoint: true,

                    fullWidth: false,
                    plugins: [
                Chartist.plugins.tooltip()
            ],
                    axisY: {
                        labelInterpolationFnc: function (value) {
                            return (value / 1);
                        }
                    },
                    showArea: true
                });
                // counter
                $(".counter").counterUp({
                    delay: 100,
                    time: 1200
                });

            });

            </script>

        @endsection