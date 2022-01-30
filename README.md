# README

Simple demo showcasing how to toggle & autosave todos using Stimulus Reflex.


### Instructions

* `bundle install`
* `yarn install`
* `bin/rails dev:cache`
* `bin/rails s`
* `foreman start -f Procfile.dev`


### Source code


* [`app/controllers/todos_controller.rb#L9-L14`](https://github.com/thomasbrus/stimulus-reflex-demo/blob/main/app/controllers/todos_controller.rb#L9-L14)
* [`app/reflexes/todos_reflex.rb`](https://github.com/thomasbrus/stimulus-reflex-demo/blob/main/app/reflexes/todos_reflex.rb)
* [`app/views/todos/_form.html.erb#L1`](https://github.com/thomasbrus/stimulus-reflex-demo/blob/main/app/views/todos/_form.html.erb#L1)
* [`app/views/todos/_todo.html.erb#L4`](https://github.com/thomasbrus/stimulus-reflex-demo/blob/main/app/views/todos/_todo.html.erb#L4)

### Screenshots

![localhost_3000_todos_1_edit (1)](https://user-images.githubusercontent.com/232034/151704543-a553ba5c-f0b3-45a8-9d0d-cd6b3d526cbc.png)
![localhost_3000_todos_1_edit](https://user-images.githubusercontent.com/232034/151704542-ea54b18c-14b3-4195-97a9-a7b7ff30c1c1.png)
