require 'administrate/field/jsontable'

describe Administrate::Field::Jsontable do
  describe '#to_partial_path' do
    it 'returns a partial based on the page being rendered' do
      assert_partial_path(page: :show)
    end

    it 'returns a partial for index page' do
      assert_partial_path(page: :index)
    end
  end

  private

  def assert_partial_path(page:)
    field = Administrate::Field::Jsontable.new(:status, 'status', page)

    path = field.to_partial_path

    expect(path).to eq("/fields/jsontable/#{page}")
  end
end
