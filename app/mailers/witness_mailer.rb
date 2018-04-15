class WitnessMailer < ApplicationMailer
  def new_witness(witness)
      @witness = witness
      mail(to: @witness.email, subject: "Gracias por registrarte como testigo")
  end
end
