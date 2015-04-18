FactoryGirl.define do
  factory :task, class: Yhoshino11Todo::Task do
    name    "Wake up"
    content "finish preparing to work."
    status  false
  end
end
