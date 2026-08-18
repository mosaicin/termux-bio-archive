require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  test "accepts a pending response" do
    biography = Biography.create!(title: "Response test", slug: "response-test", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    response = Response.new(biography: biography, name: "Reader", body: "This is a considered reply.", status: "pending")
    assert response.valid?
    assert_equal "pending", response.status
  end

  test "rejects blank responses" do
    biography = Biography.create!(title: "Blank response test", slug: "blank-response-test", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    response = Response.new(biography: biography, name: "Reader", body: "", status: "pending")
    assert_not response.valid?
  end
end
