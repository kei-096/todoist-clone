$(document).ready(function(){
	$('[id^=modal-show]').click(function(event){
		event.preventDefault();
		let e = $(this);
		let todoId = (e.parent()[0].id)
		
		$.ajax({
			url: `/todos/${todoId}/find`,
			type: 'GET',
			dataType: 'json',
			success: function(data){
				let title = data.title
				let due = data.due_date

				$(`#modal-title${todoId}`).html('<i class="circle outline icon"></i>' + title)

				var d = new Date(due);
				var month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

				var date = month[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
				var time = d.toLocaleTimeString().toLowerCase().replace(/([\d]+:[\d]+):[\d]+(\s\w+)/g, "$1$2");


				$(`#modal-due${todoId}`).html(date + " at " + time)

				$(`#modal${todoId}`).modal('show');
			}
		})
	});

	// $('[id^=form]').submit(function(event){
	// 	event.preventDefault();
	// 	let e = $(this)
	// 	console.log(e)
	// 	todoId = e[0].id.match(/\d+/)[0];
	// 	console.log(todoId)
	// 	$.ajax({
	// 		url: `/todos/${todoId}/add_image`,
	// 		type: 'POST',
	// 		dataType: 'json',
	// 		success: function(data){
	// 			console.log(data)
	// 		}
	// 	})
	// });

	$('[id^=add-gif]').click(function(event){
		let e = $(this)
		let gifId = e[0].id
		event.preventDefault();
		$(`#hidden-gif-search-${gifId}`).fadeToggle();
		$(`#close-icon-in-${gifId}`).click(function(){
			$(`#hidden-gif-search-${gifId}`).hide();
		});
	});
	$('[id^=hidden-gif-search-add-gif]').keyup(function(){
		let e = $(this)
		let gifId = e.parent().children('div')[0].id
		console.log(gifId)
		$('.ui.search.gif')
		  .search({
		    apiSettings: {
		    	onResponse: function(myResponse) {
		    		let response = {
		    			results: []
		    		}
		    		$.each(myResponse.data, function(index, item){
		    			response.results.push({
		    				title: item.title,
		    				image: item.images.original.url,
		    			})
		    		})
		    		return response
		    	},
		      url: "http://api.giphy.com/v1/gifs/search?q={query}&api_key=vR83KGIDt6gFnq0SNXtG7UsKM3GWXQox&limit=5"
		    },
		    fields: {
		      results : 'results',
		      title   : 'title',
		      image   : "image"
		    },
		    minCharacters : 3,
		    onSelect: function(result) {
		    	console.log(result)
		    	$(`#description-${gifId}`).append(`<img src="${result.image}">`)
		    }
		 });
	});

});





