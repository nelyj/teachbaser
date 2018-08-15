class Teachbaser
  operation :get_course do
    documentation 'https://go.teachbase.ru/lurker/endpoint/v1/courses/__id-GET.html'

    http_method :get

    path { |id:, **| "courses/#{id}" }

    query do
      attribute :id, Types::Coercible::Integer
    end

    response :success, 200 ,format: :json, model: Course
  end
end
