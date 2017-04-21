class Teachbaser
  operation :get_courses do
    documentation 'http://go.teachbase.ru/lurker/endpoint/v1/courses-GET.html'

    http_method :get

    path { "courses" }

    query do
      attributes do
        attribute :page,     Types::Coercible::Int, optional: true
        attribute :per_page, Types::Coercible::Int, optional: true
      end
    end

    response :success, 200 ,format: :json, model: Courses
  end
end
