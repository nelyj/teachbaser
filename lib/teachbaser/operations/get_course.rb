class Teachbaser
  operation :get_course do
    documentation 'http://go.teachbase.ru/lurker/endpoint/v1/courses/__id-GET.html'

    http_method :get

    path { |id:, **| "courses/#{id}" }

    query do
      attribute :id, Types::Coercible::Int
    end

    response :success, 200 ,format: :json, model: Course
  end
end
