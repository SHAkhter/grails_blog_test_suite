Given(/^I am reading a blog post from my favorite blogger$/) do

  visit GrailsBlogHome
  @current_page.topPostLink
  on_page GrailsShow

end
When(/^I log into the blog$/) do
  visit LoginPage
  @current_page.username = 'commenter'
  @current_page.password= '4321abcd'
  @current_page.login
  visit GrailsBlogHome
end

When(/^I add my genius comment to the blog post$/) do
  @data = {comment: 'this stinks'}
  @current_page.display_comments
  @current_page.populate_page_with @data
  @current_page.save
end

Then(/^my genius comment is at the top of the blog post comments$/) do


  expect(@current_page.comment_item).to include(@data[:comment])
end


Then(/^I should see comments left by other readers$/) do

  @data = { name: 'saife', comment: 'this stinks'}

  expect(@current_page.comment_item).to include(@data[:comment])
end

