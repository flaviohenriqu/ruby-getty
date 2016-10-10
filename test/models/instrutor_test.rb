require 'test_helper'

class InstrutorTest < ActiveSupport::TestCase
  def setup
    @instrutor = Instrutor.new(nome: "Example Professor", email: "user@example.com", profissao: "Test Profissao")
  end

  test "should be valid" do
    assert @instrutor.valid?
  end

  test "name should be present" do
    @instrutor.nome = "     "
    assert_not @instrutor.valid?
  end

  test "email should be present" do
    @instrutor.email = "     "
    assert_not @instrutor.valid?
  end

  test "name should not be too long" do
    @instrutor.nome = "a" * 51
    assert_not @instrutor.valid?
  end

  test "email should not be too long" do
    @instrutor.email = "a" * 244 + "@example.com"
    assert_not @instrutor.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @instrutor.email = valid_address
      assert @instrutor.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_instrutor = @instrutor.dup
    duplicate_instrutor.email = @instrutor.email.upcase
    @instrutor.save
    assert_not duplicate_instrutor.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @instrutor.email = mixed_case_email
    @instrutor.save
    assert_equal mixed_case_email.downcase, @instrutor.reload.email
  end
end
