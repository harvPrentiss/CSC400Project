jQuery ->
   if $('.pagination').length
      $('#articles_table').scroll ->
              url = $('.pagination .next_page').attr('href')          
              if url &&  $('#articles_table')[0].scrollHeight -    
              $('#articles_table').scrollTop() < 700                  
                      $('.pagination').text('Fetching more users...')
                      $.getScript(url)
$('#articles_table').scroll()