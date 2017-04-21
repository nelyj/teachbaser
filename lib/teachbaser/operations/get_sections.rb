class Teachbaser
  operation :get_sections do
    documentation 'http://go.teachbase.ru/lurker/endpoint/v1/courses/__course_id/sections-GET.html'

    http_method :get

    path { |course_id:, **| "courses/#{course_id}/sections" }

    query do
      attributes do
        attribute :course_id, Types::Coercible::Int
        attribute :page,      Types::Coercible::Int, optional: true
        attribute :per_page,  Types::Coercible::Int, optional: true
      end
    end

    response :success, 200 ,format: :json, model: Sections
  end
end
