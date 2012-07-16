# -*- encoding : utf-8 -*-
require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "newsletter" do
    @expected.subject = 'NewsletterMailer#newsletter'
    @expected.body    = read_fixture('newsletter')
    @expected.date    = Time.now

    assert_equal @expected.encoded, NewsletterMailer.create_newsletter(@expected.date).encoded
  end

end
