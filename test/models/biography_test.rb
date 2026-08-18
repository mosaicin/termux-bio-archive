require "test_helper"

class BiographyTest < ActiveSupport::TestCase
  test "accepts only editorial statuses" do
    biography = Biography.new(title: "Example", slug: "example", summary: "A summary", body: "A body", author_name: "Desk", fictional: true, status: "unverified")
    assert biography.valid?
    biography.status = "accused"
    assert_not biography.valid?
  end

  test "publicly visible scope excludes drafts" do
    published = Biography.create!(title: "Published", slug: "published", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "published")
    Biography.create!(title: "Draft", slug: "draft", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    assert_includes Biography.publicly_visible, published
    assert_equal [published], Biography.publicly_visible.to_a
  end
end
