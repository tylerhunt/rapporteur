module Rapporteur
  # An ActiveModel::Serializer used to serialize the checker data for JSON
  # rendering.
  #
  class Serializer < ActiveModel::Serializer
    self.root = false

    attributes :revision,
               :time,
               :messages

    # Internal: Converts the checker instance time into UTC to provide a
    # consistent public representation.
    #
    # Returns a Time instance in UTC.
    #
    def time
      object.time.utc
    end

    # Internal: Used by ActiveModel::Serializer to determine whether or not to
    # include the messages attribute.
    #
    # Returns false if the messages are empty.
    #
    def include_messages?
      !object.messages.empty?
    end
  end
end