# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


#Doctors
Doctor.create(:first_name => 'Edward', :last_name => 'Jenner', :email => 'vaccine@first.history', :degrees => 'MD')

Doctor.create(:first_name => 'Carl', :last_name=> 'Jung', :email => 'swiss@psycho.history', :degrees => 'MD')

Doctor.create(:first_name => 'Charles', :last_name=> 'Mayo', :email => 'founder@mayo.clinic', :degrees => 'MD')

Doctor.create(:first_name => 'Hans', :last_name=> 'Asperger', :email => 'asperger@syn.drome', :degrees => 'MD')

Doctor.create(:first_name => 'Default', :last_name=> 'Default', :email => 'noreply@email.com', :degrees => 'MD')

#Diagnoses
Diagnosis.create(:name => 'Asperger', :description => %{<p> Asperger syndrome is often considered a high functioning form of autism. People with this syndrome have difficulty interacting socially, repeat behaviors, and often are clumsy. Motor milestones may be delayed </p>}, :reference_number => '123-ASP')

Diagnosis.create(:name => 'Bronchitis', :description => %{<p>Bronchitis is inflammation of the main air passages to the lungs. Bronchitis may be short-lived (acute) or chronic, meaning that it lasts a long time and often recurs. </p>}, :reference_number => '456-BRO')

Diagnosis.create(:name => 'Encephalitis', :description => %{<p>Encephalitis is irritation and swelling (inflammation) of the brain, most often due to infections.</p>}, :reference_number => '798-ENC')

Diagnosis.create(:name => 'Default', :description => %{<p>Default diagnosis</p>}, :reference_number => '000-AAA')


#Patients
Patient.create(:first_name => 'Nicholai', :last_name => 'Plano', :age => 60)

Patient.create(:first_name => 'Nicholai', :last_name => 'Richardson', :age => 45)

Patient.create(:first_name => 'Nicholai', :last_name => 'Grapevine', :age => 70)

Patient.create(:first_name => 'Nicholai', :last_name => 'Alamo', :age => 37)

Patient.create(:first_name => 'Nicholai', :last_name => 'Corsicana', :age => 46)


