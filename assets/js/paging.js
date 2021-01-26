//Artists
	$(document).ready(function(){  
		load_data();  
			function load_data(page)  
			{  
			$.ajax({  
				url:"../../paging-artists.php",  
                method:"POST",  
                data:{page:page},  
                success:function(data){  
					$('#artists_data').html(data);  
                }  
           })  
      }  
      $(document).on('click', '.artists_link', function(){  
           var page = $(this).attr("id");  
           load_data(page);  
      });  
 });  
 
//Genres
	$(document).ready(function(){  
		load_data();  
			function load_data(page)  
			{  
			$.ajax({  
				url:"../../paging-genres.php",  
                method:"POST",  
                data:{page:page},  
                success:function(data){  
					$('#genres_data').html(data);  
                }  
           })  
      }  
      $(document).on('click', '.genres_link', function(){  
           var page = $(this).attr("id");  
           load_data(page);  
      });  
 });  
 
//Bands
	$(document).ready(function(){  
		load_data();  
			function load_data(page)  
			{  
			$.ajax({  
				url:"../../paging-bands.php",  
                method:"POST",  
                data:{page:page},  
                success:function(data){  
					$('#bands_data').html(data);  
                }  
           })  
      }  
      $(document).on('click', '.bands_link', function(){  
           var page = $(this).attr("id");  
           load_data(page);  
      });  
 }); 