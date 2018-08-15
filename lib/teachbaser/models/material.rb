class Teachbaser
  class Material < Evil::Struct
    attribute :id,                Types::Integer
    attribute :name,              Types::String
    attribute :description,       Types::String
    attribute :section_id,        Types::Integer
    attribute :course_id,         Types::Integer
    attribute :account_id,        Types::Integer
    attribute :position,          Types::Integer
    attribute :is_external,       Types::Bool
    attribute :external_type,     Types::String,  optional: true
    attribute :has_file,          Types::Bool
    attribute :extension,         Types::String,  optional: true
    attribute :file_name,         Types::String,  optional: true
    attribute :file_content_type, Types::String,  optional: true
    attribute :category,          Types::String,  optional: true
    attribute :file_size,         Types::Integer, optional: true
    attribute :size,              Types::String,  optional: true
    attribute :thumb_url,         Types::String,  optional: true
    attribute :view_url,          Types::String,  optional: true
    attribute :view_url_cors,     Types::String,  optional: true
    attribute :poster_url,        Types::String,  optional: true
    attribute :status_code,       Types::String
    attribute :status_name,       Types::String
  end

  class Materials < Evil::Struct
    attribute :data, Types::Strict::Array.of(Material)
  end
end
