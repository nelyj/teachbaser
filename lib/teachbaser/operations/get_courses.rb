class Teachbaser
  operation :get_courses do
    documentation 'https://go.teachbase.ru/lurker/endpoint/v1/courses-GET.html'

    http_method :get

    path { "courses" }

    query do
      attributes do
        attribute :page,     Types::Coercible::Integer, optional: true
        attribute :per_page, Types::Coercible::Integer, optional: true
      end
    end

    response :success, 200 ,format: :json, model: Courses
  end
end
