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
});

