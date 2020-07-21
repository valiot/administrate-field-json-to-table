# frozen_string_literal: true

module ReadFixture
  def read_fixture(filename)
    IO.read(File.expand_path("../../fixtures/jsontable/#{filename}", __FILE__))
  end
end
