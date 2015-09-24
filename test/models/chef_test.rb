require "test_helper"

class ChefTest <ActiveSupport::TestCase
  
  def setup
  @chef= Chef.new(chefname: "John", email: "john@example.com")
  end
  
  test "chef name should be valid" do
    assert @chef.valid?
  end
  
  test "chef name must be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chef must be to long" do
    @chef.chefname ="a"*41
    assert_not @chef.valid?
  end
  
  
  test "chef must be to short" do
    @chef.chefname= "aa"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email= ""
    assert_not @chef.valid?
  end

  
  test "email must be inbound" do
    @chef.email = "a"*101+"@example.com"
    assert_not @chef.valid?
  end
  
  test "should be unique" do
    dup_chef=  @chef.dup
    dup_chef.email =@chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
    
    test "email validation should accept valid addresses" do
      valid_addresses = %w[user@eee.com Rtff-ds@eee.hello.org user@example.se jojo@klkl.pj]
      valid_addresses.each do |va|
        @chef.email = va
        assert @chef.valid?, '#{va.inspect} should be valid'
      end
    end
    
    test "email validation should not accept valid addresses" do
      invalid_addresses = %w[user@example,com user_at.com tetst@i_am_.com]
      invalid_addresses.each do |ia|
        @chef.email= ia
        assert_not @chef.valid?, '#{va.inspect} should be invalid'
      end
    end
    

  
  
    
  
end
  