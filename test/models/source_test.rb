require "test_helper"

class SourceTest < ActiveSupport::TestCase
  test "accepts an https source URL" do
    biography = Biography.create!(title: "Source test", slug: "source-test", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    source = Source.new(biography: biography, title: "Archive", url: "https://example.org/source", notes: "A note")
    assert source.valid?
  end

  test "rejects unsafe source URLs" do
    biography = Biography.create!(title: "Unsafe source test", slug: "unsafe-source-test", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    source = Source.new(biography: biography, title: "Archive", url: "javascript:alert(1)", notes: "A note")
    assert_not source.valid?
  end
end
