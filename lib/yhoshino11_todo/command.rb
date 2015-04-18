# coding: utf-8

module Yhoshino11Todo
  class Command

    def execute
      DB.prepare
    end

    def create_task(name, content)
      Task.create!(name: name, content: content).reload
    end

    def update_task(id, attributes)
      if status_name = attributes[:status]
        attributes[:status] = Task::STATUS.fetch(status_name.upcase)
      end

      task = Task.find(id)
      task.update_attributes! attributes

      task.reload
    end

    def delete_task(id)
      task = Task.find(id)
      task.destroy
    end
  end
end
