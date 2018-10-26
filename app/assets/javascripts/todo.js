// function showModal(){
// 	$('.ui.modal').modal('show');
// };

$(document).ready(function(){
	$('.modal-show').click(function(event){
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
				$('#modal-title').html('<i class="circle outline icon"></i>' + title)

				var d = new Date(due);
				var month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

				var date = month[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
				var time = d.toLocaleTimeString().toLowerCase().replace(/([\d]+:[\d]+):[\d]+(\s\w+)/g, "$1$2");


				$('#modal-due').html(date + " at " + time)
				$('.ui.modal').modal('show');
			}
		})
	});
	$('#add-gif').click(function(event){
		event.preventDefault();
		$('#add-gif').hide();
		$('#hidden-gif-search').fadeToggle();
		$('.close.icon').click(function(){
			$('#add-gif').show();
			$('#hidden-gif-search').hide();
		});
	});
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
	    		console.log(response)
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

	    	$('.description').append(`<img src="${result.image}">`)
	    }
	 });

});

var xhr = $.get("http://api.giphy.com/v1/gifs/search?q=ryan+gosling&api_key=vR83KGIDt6gFnq0SNXtG7UsKM3GWXQox&limit=5");
xhr.done(function(giphy) { 
	console.log(giphy.data[0].images.original.url)
});




