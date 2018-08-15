class Teachbaser
  class Course < Evil::Struct
    attribute :id,            Types::Integer
    attribute :name,          Types::String
    attribute :created_at,    Types::DateTime
    attribute :updated_at,    Types::DateTime
    attribute :owner_id,      Types::Integer
    attribute :owner_name,    Types::String
    attribute :thumb_url,     Types::String,   optional: true
    attribute :cover_url,     Types::String,   optional: true
    attribute :description,   Types::String
    attribute :last_activity, Types::DateTime, optional: true
    attribute :total_score,   Types::Integer
    attribute :total_tasks,   Types::Integer
    attribute :types,         Types::Array
    attribute :authors,       Types::Array,    optional: true
    attribute :sections,      Types::Array.of(Section),    optional: true
    attribute :is_netology,   Types::Bool
    attribute :bg_url,        Types::String,   optional: true
    attribute :video_url,     Types::String,   optional: true
    attribute :demo,          Types::Bool
  end


  class Courses < Evil::Struct
    attribute :data, Types::Strict::Array.of(Course)
  end
end
