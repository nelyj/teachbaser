class Teachbaser
  class Course < Evil::Struct
    attribute :id,            Types::Int
    attribute :name,          Types::String
    attribute :created_at,    Types::DateTime
    attribute :updated_at,    Types::DateTime
    attribute :owner_id,      Types::Int
    attribute :owner_name,    Types::String
    attribute :thumb_url,     Types::String,   optional: true
    attribute :cover_url,     Types::String,   optional: true
    attribute :description,   Types::String
    attribute :last_activity, Types::DateTime, optional: true
    attribute :total_score,   Types::Int
    attribute :total_tasks,   Types::Int
    attribute :types,         Types::Array
    attribute :authors,       Types::Array,    optional: true
    attribute :sections,      Types::Array.member(Section),    optional: true
    attribute :is_netology,   Types::Bool
    attribute :bg_url,        Types::String,   optional: true
    attribute :video_url,     Types::String,   optional: true
    attribute :demo,          Types::Bool
  end


  class Courses < Evil::Struct
    attribute :data, Types::Array.member(Course)
  end
end
