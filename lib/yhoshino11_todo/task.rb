# condig: utf-8

require 'active_record'

module Yhoshino11Todo
  class Task < ActiveRecord::Base
    NOT_YET = 0
    DONE = 1
    PENDING = 2

    STATUS = {
      'NOT_YET' => NOT_YET,
      'DONE'    => DONE,
      'PENDING' => PENDING
    }.freeze
  end
end
