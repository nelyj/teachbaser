require 'teachbaser/models/material'

class Teachbaser
  class Section < Evil::Struct
    attribute :id,                Types::Integer
    attribute :course_id,         Types::Integer
    attribute :name,              Types::String
    attribute :icon_url,          Types::String, optional: true
    attribute :small_url,         Types::String, optional: true
    attribute :thumb_url,         Types::String, optional: true
    attribute :icon_content_type, Types::String, optional: true
    attribute :materials,         Types::Array.of(Material), optional: true
    attribute :quizzes,           Types::Array,  optional: true
    attribute :tasks,             Types::Array,  optional: true
  end

  class Sections < Evil::Struct
    attribute :data, Types::Strict::Array.of(Section)
  end
end
