# class Job
#   include AASM

#   aasm do
#     Начальное состояние
#     state :sleeping, initial: true
#     state :running, :cleaning

#     Событие и переходы
#     event :run do
#       transitions from: :sleeping, to: :running
#     end

#     event :clean do
#       transitions from: :running, to: :cleaning
#     end

#     event :sleep do
#       Одинаковое событие для перехода из нескольких состояний
#       transitions from: [:running, :cleaning], to: :sleeping
#     end
#   end

# end


# job = Job.new
# У модели появляются функции-предикаты, которые позволяют определить состояние
# job.sleeping? # => true
# job.may_run?  # => true
# job.run
# job.running?  # => true
# job.sleeping? # => false
# job.may_run?  # => false
# job.run       # => raises AASM::InvalidTransition

# class CreatetABLE < ActiveRecord::Migration[6.1]
#   def change
#     create_table :examples do |t|
#       По дефолту используется имя колонки aasm_state
#       t.string :aasm_state

#       t.timestamps
#     end
#   end
# end

# job = Job.new
# job.run   # not saved
# События с ! сохраняют модель
# job.run!  # saved

# # or
# job.aasm.fire(:run) # not saved
# job.aasm.fire!(:run) # saved

# resources :vacancies do
#   Запрос на изменение состояния выполняется с глаголом PATCH
#   https://www.restapitutorial.com/lessons/httpmethods.html
#   member do
#     patch :run
#   end
# end
