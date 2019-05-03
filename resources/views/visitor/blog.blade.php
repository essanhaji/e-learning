@extends('visitor.layout')
@section('content')

<div class="page-title parallax parallax4">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="page-title-heading">
                    <h2 class="title">Our Blog</h2>
                </div><!-- /.page-title-heading -->
                <div class="breadcrumbs">
                    <ul>
                        <li><a href="{{ url('/') }}">Home</a></li>
                        <li>Blog</li>
                    </ul>
                </div><!-- /.breadcrumbs -->
            </div><!-- /.col-md-12 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div><!-- /page-title parallax -->

<section class="main-content blog-posts blog-grid have-sidebar">
    <div class="container">
        <div class="blog-title">
            <h1 class="bold">News & Blog</h1>
        </div>

        <div class="post-content">

            <div class="post-wrap clearfix">

                @foreach($blog as $post)
                <article class="post flat-hover-zoom">
                    <div class="featured-post">
                        <div class="entry-image">
                            <img width="350px" src="{{ asset('storage/'.$post->image) }}" alt="{{ $post->title }}">
                        </div>
                    </div>

                    <div class="date-post">
                        @php
                        $date0 = explode(' ',$post->updated_at);
                        $date = explode('-',$date0[0]);
                        $M= $date[1];
                        $D = $date[2];
                        $dateObj = DateTime::createFromFormat('!m', $M);
                        $monthName = $dateObj->format('F')
                        @endphp
                        <span class="numb">{{ $D }}</span>
                        <span>{{ $monthName }}</span>
                    </div>

                    <div class="content-post">
                        <h2 class="title-post">
                            <a href="{{ url('blog/'.$post->slug) }}">{{ str_limit($post->title, 25) }}</a>
                        </h2>

                        <div class="entry-content">
                            <p>
                                {{ str_limit($post->excerpt, 120) }}
                            </p>
                        </div><!-- /entry-post -->

                        <div>
                            <a href="{{ url('blog/category/'.$post->category->slug) }}">
                                <span class="badge" style="background-color: #ffaa30;">{{ $post->category->name }}</span>
                            </a>
                        </div>
                    </div><!-- /content-post -->
                </article><!-- /post -->
                @endforeach

            </div><!-- /post-wrap -->

            <div class="blog-pagination">
                @php
                $links = $blog->links();

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
                        <a href="{{ url('blog/') }}" @if($categoryIdActive=='' ) style="color: #ffaa30;" @endif>All Posts</a>
                        <span class="badge" style="background-color: #ffaa30; color:white;">{{ $blog->count() }}</span>
                    </li>
                    @foreach($categories as $category)
                    <li>
                        <a href="{{ url('blog/category/'.$category->slug) }}" @if($categoryIdActive=='' .$category->id) style="color: #ffaa30;" @endif>{{ $category->name }}</a>
                        <span class="badge" style="background-color: #ffaa30; color:white;">{{ $category->posts->count() }}</span>
                    </li>
                    @endforeach
                </ul>
            </div>



            <div class="widget widget-popular-news">
                <h5 class="widget-title">Recent posts</h5>
                <ul class="popular-news clearfix">
                    @foreach($lastPosts as $lastPost)
                    <li>
                        <div class="thumb">
                            <img width="100px" src="{{ asset('storage/'.$lastPost->image) }}" alt="{{ $lastPost->title }}">
                        </div>
                        @php
                        $date0 = explode(' ',$lastPost->updated_at);
                        $date = explode('-',$date0[0]);
                        $M= $date[1];
                        $D = $date[2];
                        $Y = $date[0];
                        $dateObj = DateTime::createFromFormat('!m', $M);
                        $monthName = $dateObj->format('F')
                        @endphp
                        <div class="text">
                            <a href="{{ url('blog/'.$lastPost->slug) }}">{{ str_limit($lastPost->title, 28) }}</a>
                            <p>{{ $monthName }} &nbsp; {{ $D }}, {{ $Y }} </p>
                        </div>
                    </li>
                    @endforeach
                </ul><!-- /popular-news clearfix -->
            </div><!-- /widget widget-popular-news -->


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