class Teachbaser
  operation :get_materials do
    documentation 'http://go.teachbase.ru/lurker/endpoint/v1/sections/__section_id/materials-GET.html'

    http_method :get

    path { |section_id:, **| "sections/#{section_id}/materials" }

    query do
      attributes do
        attribute :section_id, Types::Coercible::Int
        attribute :page,       Types::Coercible::Int, optional: true
        attribute :per_page,   Types::Coercible::Int, optional: true
      end
    end

    response :success, 200 ,format: :json, model: Materials
  end
end