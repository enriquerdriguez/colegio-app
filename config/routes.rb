Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resources :students
  resources :students do
    resources :change_courses, only:[:new, :create]
  end
  resources :professors do
    resources :professor_view_students, only: [:index]
  end
  resources :subjects
  resources :courses
  resources :course_subjects, except: [:index, :show]
  resources :professor_subjects, only: [:create, :destroy]
  resources :student_subjects, only: [:create, :destroy]
  post 'add_course', to: "change_courses#change"
  resources :course_subjects_professor, only: [:new, :create, :destroy]
end
