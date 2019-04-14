# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  default from: "eventsurfer"

  def entry_email(order, user)
    @group_ticket = order
    @number_of_tickets = GroupTicket.where(order_id: order.id)
    @total_prize = "" # TODO: Change
    @user = user
    mail(subject: "EXAMPLE ENTRY ORDER", to: user.email)
  end
end
