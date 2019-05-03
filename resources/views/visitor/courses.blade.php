@extends('visitor.layout')
@section('content')

<div class="page-title parallax parallax4">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="page-title-heading">
                    <h2 class="title">TOTAL COURSES {{ $countFreeCourses + $countNotFreeCourses}}</h2>
                </div><!-- /.page-title-heading -->
                <div class="breadcrumbs">
                    <ul>
                        <li><a href="{{ url('/') }}">Home</a></li>
                        <li>Courses Grid</li>
                    </ul>
                </div><!-- /.breadcrumbs -->
            </div><!-- /.col-md-12 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div><!-- /page-title parallax -->

<section class="main-content blog-posts flat-row course-list have-sidebar">
    <div class="container">
        <div class="blog-title clearfix">
            <h1 class="bold">LIST COURSES</h1>
        </div>
        <div class="row_course">
            <div class="post-content">
                <div class="flat-post-ordering clearfix">
                    <form method="get" action="{{ url('courses') }}">
                        <div class="sort-views">
                            <label class="modern-select">
                                <select name="category" class="orderby">
                                    <option value="All" @if($categoryIdActive=='' ) selected="selected" @endif>All Categories</option>
                                    @foreach($categories as $category)
                                    <option value="{{ $category->id }}" @if($categoryIdActive=="" .$category->id) selected="selected" @endif>{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </label>

                            <label class="modern-select">
                                <select name="price" class="orderby">
                                    <option value="All" @if($priceActive=='' ) selected="selected" @endif>All Prices</option>
                                    <option value="Free" @if($priceActive=="Free" ) selected="selected" @endif>Free</option>
                                    <option value="Paid" @if($priceActive=="Paid" ) selected="selected" @endif>Paid</option>
                                </select>
                            </label>

                            <div class="list-grid">
                                &nbsp;
                                <button type="submit" class="btn btn-outline-warning" style="height: 40px"><span><i class="fa fa-search" aria-hidden="true"></i></span></button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="post-warp clearfix">


                    @foreach($courses as $course)

                    <div class="flat-course flat-hover-zoom">
                        <div class="featured-post">
                            <div class="overlay">
                                <div class="link"></div>
                            </div>

                            <div class="entry-image">
                                <a href="{{ url('courses/'.$course->slug) }}"><img src="{{ asset('storage/'.$course->image) }}" alt="{{ $course->title }}"></a>
                            </div>
                        </div><!-- /.featured-post -->

                        <div class="course-content">
                            <h4><a href="{{ url('courses/'.$course->slug) }}" title="{{ $course->title }}">{{ str_limit($course->title, 30) }}</a> </h4>

                            <ul class="course-meta review clearfix">
                                <li class="author">
                                    <div class="thumb">
                                        <img src="{{ asset('storage/'.$course->teacher->user->avatar) }}" alt="{{ $course->teacher->user->name }}">
                                    </div>

                                    <div class="text">
                                        <a href="{{ url('teachers/'.$course->teacher->slug) }}">{{ $course->teacher->user->name }}</a>
                                        <p>Teacher</p>
                                    </div>
                                </li>
                                <li class="review-stars">
                                    @for($i=1; $i<=5; $i++) @if($i <=$course->rate())
                                        <i class="fa fa-star"></i>
                                        @else
                                        <i class="fa fa-star-o"></i>
                                        @endif
                                        @endfor
                                </li>

                                <li>{{ $course->courseSessions->count() }} &nbsp; Sessions</li>
                            </ul>

                            <p>{{ str_limit($course->small_description, 180) }}</p>
                            
                            <ul class="course-meta desc">
                                <li>
                                    <h6>{{ str_limit($course->created_at, 10, '') }}</h6>
                                    <span>Started at</span>
                                </li>

                                <li>
                                    <h6>{{ $course->duration }}</h6>
                                    <span>Hours</span>
                                </li>

                                <li>
                                    <h6><a href="{{ url('courses/category/'.$course->category->slug) }}">{{ str_limit($course->category->name, 12) }}</a></h6>
                                    <span>Category</span>
                                </li>

                                <li>
                                    @if($course->price != 0)
                                    <h6><span style="background-color: #ffaa30;" class="badge badge-warning">{{ $course->price }} DH</span></h6>
                                    <span> Price</span>
                                    @else
                                    <h6><span style="background-color: #ffaa30; color: black" class="badge badge-warning">Free</span></h6>
                                    <span> For Free</span>
                                    @endif
                                </li>

                            </ul>
                            <a class="flat-button orange" href="{{ url('courses/'.$course->slug) }}">SEE MORE</a>
                        </div><!-- /.course-content -->
                    </div>

                    @endforeach
                </div><!-- / .post-wrap -->

                <div class="blog-pagination">
                    @php
                    $links = $courses->links();

                    $links = str_replace('class="pagination"', 'class="flat-pagination"', $links);
                    $links = str_replace('<span class="page-link" aria-hidden="true">&lsaquo;</span>', '<a class="page-link" aria-hidden="true">&lsaquo;</a>', $links);
                    $links = str_replace('<span class="page-link" aria-hidden="true">&rsaquo;</span>', '<a class="page-link" aria-hidden="true">&rsaquo;</a>', $links);
                    @endphp
                    <center>{!! $links !!}</center>
                </div>

            </div>
            <div class="sidebar">
                <div class="widget widget-categories">
                    <h5 class="widget-title">Categories</h5>
                    <ul>
                        <li>
                            <a href="{{ url('courses/') }}" @if($categoryIdActive=='' ) style="color: #ffaa30;" @endif>All Courses</a>
                            <span class="badge" style="background-color: #ffaa30; color:white;">{{ $countFreeCourses + $countNotFreeCourses}}</span>
                        </li>
                        @foreach($categories as $category)
                        <li>

                            <a href="{{ url('courses/category/'.$category->slug) }}" @if($categoryIdActive=='' .$category->id) style="color: #ffaa30;" @endif>{{ $category->name }}</a>
                            <span class="badge" style="background-color: #ffaa30; color:white;">{{ $category->courses->count() }}</span>
                        </li>
                        @endforeach
                    </ul>
                </div>

                <div class="widget widget-teacher">
                    <h5 class="widget-title">Browse by Teacher</h5>
                    <div class="text-teacher">
                        <p>Lorem ipsum sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    <ul class="teacher-news clearfix">
                        @foreach($teachers as $teacher)
                        <li>
                            <div class="thumb">
                                <img src="{{ asset('storage/'.$teacher->user->avatar) }}" alt="{{ $teacher->user->name }}">
                            </div>
                            <div class="text">

                                <a href="{{ url('courses/teachers/'.$teacher->slug) }}" title="{{ $teacher->user->name }}">{{ str_limit($teacher->user->name, 13) }}</a>
                                <p>{{ str_limit($teacher->category->name, 15) }}</p>

                            </div>
                            <ul class="flat-socials">
                                <li class="review-stars">
                                    @for($i=1; $i<=5; $i++) @if($i <=$teacher->rate())
                                        <i class="fa fa-star"></i>
                                        @else
                                        <i class="fa fa-star-o"></i>
                                        @endif
                                        @endfor
                                </li>
                            </ul>
                        </li>
                        @endforeach

                    </ul><!-- /popular-news clearfix -->
                    <center>{{ $teachers->links() }}</center>
                </div>

                <div class="widget widget-featured-courses">
                    <h5 class="widget-title">Best courses</h5>
                    <ul class="featured-courses-news clearfix">
                        @foreach($bestPriceCourses as $bestPriceCourse)
                        <li>
                            <div class="thumb">
                                <img src="{{ asset('storage/'.$bestPriceCourse->image) }}" alt="{{ $bestPriceCourse->title }}" width="105px">
                            </div>
                            <div class="text">
                                <a href="{{ url('courses/'.$bestPriceCourse->slug) }}" title="{{ $bestPriceCourse->title }}">{{ str_limit($bestPriceCourse->title, 18) }}</a>
                                <p>{{ $bestPriceCourse->teacher->user->name }}</p>
                            </div>
                            <div class="review-rating">
                                <div class="flat-money">
                                    <p>{{ $bestPriceCourse->price }} DH</p>
                                </div>
                                <div class="flat-money" style="background-color: #ffaa30;">
                                    <a href="{{ url('courses/'.$bestPriceCourse->slug) }}">
                                        <p>+</p>
                                    </a>
                                </div>

                            </div>
                        </li>
                        @endforeach

                    </ul><!-- /popular-news clearfix -->
                </div><!-- /widget widget-popular-news -->
            </div><!-- /sidebar -->

        </div><!-- /row -->
    </div><!-- /container -->
</section><!-- /main-content -->




@endsection






@section('js')
<!-- vue js et axios -->
<!-- <script type="text/javascript" src="{{ asset('js/vue/indexNewsLetter.js') }}"></script> -->

@endsection