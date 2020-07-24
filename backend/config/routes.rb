Rails.application.routes.draw do
   get 'project/list'
   get 'project/new'
   post 'project/create'
   patch 'project/update'
   get 'project/show'
   get 'project/edit'
   get 'project/delete'

   get 'photo/list'
   get 'photo/new'
   post 'photo/create'
   patch 'photo/update'
   get 'photo/show'
   get 'photo/edit'
   get 'photo/delete'
   
   
end
