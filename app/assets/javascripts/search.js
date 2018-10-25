// $(document).on('turbolinks:load', function(){
// 	$('#search').click(function(e) {
// 		e.preventDefault();
// 		let query = $('#query').val();
// 		$.ajax({
// 			url: '/todos/search',
// 			type: 'GET',
// 			data: ('query=' + query),
// 			dataType: 'json',
// 			success: function(data){
// 				$('#todo-list').find('div').remove();
// 				debugger
// 				data.each(function(i, todo){
// 					$('#todo-list').append()
// 				})
// 			}
// 		})
// 	})
// });