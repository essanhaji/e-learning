@extends('visitor.layout')
@section('content')

        <div class="page-title parallax parallax4"> 
        	<div class="overlay"></div>            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">                    
                        <div class="page-title-heading">
                            <h2 class="title">OUR TEACHERS</h2>
                        </div><!-- /.page-title-heading -->
                        <div class="breadcrumbs">
                            <ul>
                                <li><a href="{{ url('/') }}">Home</a></li>
                                <li>Teachers</li>
                            </ul>                   
                        </div><!-- /.breadcrumbs --> 
                    </div><!-- /.col-md-12 -->  
                </div><!-- /.row -->  
            </div><!-- /.container -->                      
        </div><!-- /page-title parallax -->

        <section class="flat-row pad-top-96 pad-bottom-100">
    	    <div class="container">
    			<ul class="portfolio-filter">
    	            <li class="@if($active == '') active @endif"><a href="{{ url('teachers') }}">ALL</a></li>
    	            <li class="@if($active == 'a') active @endif"><a  href="{{ url('teachers/search/a') }}">A</a></li>
    	            <li class="@if($active == 'b') active @endif"><a  href="{{ url('teachers/search/b') }}">B</a></li>
    	            <li class="@if($active == 'c') active @endif"><a  href="{{ url('teachers/search/c') }}">C</a></li>
    	            <li class="@if($active == 'd') active @endif"><a  href="{{ url('teachers/search/d') }}">D</a></li>
    	            <li class="@if($active == 'e') active @endif"><a  href="{{ url('teachers/search/e') }}">E</a></li>
    	            <li class="@if($active == 'f') active @endif"><a  href="{{ url('teachers/search/f') }}">F</a></li>
    	            <li class="@if($active == 'i') active @endif"><a  href="{{ url('teachers/search/i') }}">I</a></li>
    	            <li class="@if($active == 'j') active @endif"><a  href="{{ url('teachers/search/j') }}">J</a></li>
    	            <li class="@if($active == 'k') active @endif"><a  href="{{ url('teachers/search/k') }}">K</a></li>
    	            <li class="@if($active == 'l') active @endif"><a  href="{{ url('teachers/search/l') }}">L</a></li>
    	            <li class="@if($active == 'm') active @endif"><a  href="{{ url('teachers/search/m') }}">M</a></li>
    	            <li class="@if($active == 'n') active @endif"><a  href="{{ url('teachers/search/n') }}">N</a></li>
    	            <li class="@if($active == 'o') active @endif"><a  href="{{ url('teachers/search/o') }}">O</a></li>
    	            <li class="@if($active == 'p') active @endif"><a  href="{{ url('teachers/search/p') }}">P</a></li>
    	            <li class="@if($active == 'q') active @endif"><a  href="{{ url('teachers/search/q') }}">Q</a></li>
    	            <li class="@if($active == 'r') active @endif"><a  href="{{ url('teachers/search/r') }}">R</a></li>
    	            <li class="@if($active == 's') active @endif"><a  href="{{ url('teachers/search/s') }}">S</a></li>
    	            <li class="@if($active == 't') active @endif"><a  href="{{ url('teachers/search/t') }}">T</a></li>
    	            <li class="@if($active == 'u') active @endif"><a  href="{{ url('teachers/search/u') }}">U</a></li>
    	            <li class="@if($active == 'v') active @endif"><a  href="{{ url('teachers/search/v') }}">V</a></li>
    	            <li class="@if($active == 'w') active @endif"><a  href="{{ url('teachers/search/w') }}">W</a></li>
    	            <li class="@if($active == 'x') active @endif"><a  href="{{ url('teachers/search/x') }}">X</a></li>
    	            <li class="@if($active == 'y') active @endif"><a  href="{{ url('teachers/search/y') }}">Y</a></li>
    	            <li class="@if($active == 'z') active @endif"><a  href="{{ url('teachers/search/z') }}">Z</a></li>
    	        </ul>
    	    	
    	    	<div class="row teacher">

    		        <div class="flat-teacher-team-isotope button-right">
						   
					

						@foreach($teachers as $teacher)
    		            <div class="flat-teacher col-md-3 col-sm-6 flat-hover-zoom">
    		                <div class="entry-image">
    		                    <img src="{{ asset('storage/'.$teacher->avatar) }}" width="400px"/>
    		                </div>
    		                <div class="content">                               
    		                    <h4 class="name">
									<a href="{{ url('teachers/'.$teacher->teacher->slug) }}" width="100px" title="position">{{ $teacher->name }}</a>
								</h4>

    		                    <ul class="flat-socials">
    		                        <li class="facebook">
    		                            <a href="{{ $teacher->teacher->facebook }}"><i class="fa fa-facebook"></i></a>
    		                        </li>
    		                        <li class="twitter">
    		                            <a href="{{ $teacher->teacher->twitter }}"><i class="fa fa-twitter"></i></a>
    		                        </li>
    		                        <li class="linkedin">
    		                            <a href="{{ $teacher->teacher->linkedin }}"><i class="fa fa-linkedin"></i></a>
    		                        </li>
    		                        <li class="youtube">
    		                            <a href="{{ $teacher->teacher->youtube }}"><i class="fa fa-youtube-play"></i></a>
    		                        </li>
								</ul>
								

								<ul class="flat-socials">
									<li class="review-stars">
										@for($i=1; $i<=5; $i++) 
											@if($i <=$teacher->teacher->rate())
											<i class="fa fa-star"></i>
											@else
											<i class="fa fa-star-o"></i>
											@endif
										@endfor
									</li>
								</ul>
								
								
    		                    <ul class="flat-information">
    		                        <li class="position">
    		                            <a href="{{ url('teachers/category/'.$teacher->teacher->category->slug) }}" title="position">{{ $teacher->teacher->category->name }}</a>
    		                        </li>
    		                        <li class="phone">
    		                            <a title="Phone number">{{ $teacher->teacher->phone }}</a>
    		                        </li>
    		                        <li class="email">
    		                            <a title="Email address">{{ $teacher->email }}</a>
    		                        </li>
    		                        <li class="skype">
    		                            <a title="skype">{{ $teacher->teacher->skype }}</a>
									</li>
    		                    </ul>

    		                </div>
    		            </div>
						@endforeach

						

    		        </div><!-- /.flat-teacher-team -->
    	        </div><!-- / .row -->

				
                <div class="blog-pagination">
                    @php
                    $links = $teachers->links();

                    $links = str_replace('class="pagination"', 'class="flat-pagination"', $links);
                    $links = str_replace('<span class="page-link" aria-hidden="true">&lsaquo;</span>', '<a class="page-link" aria-hidden="true">&lsaquo;</a>', $links);
                    $links = str_replace('<span class="page-link" aria-hidden="true">&rsaquo;</span>', '<a class="page-link" aria-hidden="true">&rsaquo;</a>', $links);
                    @endphp
                    <center>{!! $links !!}</center>
                </div>
				

    	    </div><!-- / .container -->
        </section>

@endsection