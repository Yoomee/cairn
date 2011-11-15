module FeedbackForm
  
  include EnquiryForm
  
  title "Customer feedback form"
  fields :name, :job_title, :department, :hospital_care_home_or_company, :address, :post_code, :email, :contact_preference, :product_or_service, :product_or_service_specifics, :how_pleased_are_you, :value_for_money, :how_did_you_find_out, :how_do_you_find_out, :did_you_assess_others, :which_one, :how_likely_to_buy_again, :would_you_recommend, :recommendation_quote, :improvements, :contact_with_account_manager, :how_helpful, :prefer_to_place, :how_quickly , :any_problems, :what_problems, :resolved, :helpfulness_and_professionalism, :how_pleased, :willing_to_case_study, :how_complete, :more_info, :more_info_specifics, :dont_contact_in_future
    
  validates_format_of :email, :with => ValidateExtensions::EMAIL_FORMAT, :allow_blank => true
  validates_presence_of :name, :job_title, :department, :hospital_or_company, :address, :post_code
  
  email_from "site@cairntechnology.com"
  email_subject "New customer feedback response"
  email_to "info@cairntechnology.com"

  response_message "Thank you so much for completing this survey. We really appreciate your comments."

end
  
FeedbackForm::PRODUCTS = ["Bio-burden Testing", "Consumables", "Continence Products (please specify...)", "Detergents (please specify…)", "Disposa-mops (Disposable Mop)", "DryMax Combimat (Fluid control)", "DryMax Sterile (Fluid control for use near patient)", "DryMax XL (Fluid control)", "Emissions Testing for Washer Disinfectors", "Microb-in (Laboratory Waste Container)", "Respirators", "Spill Station/Kit (please specify…)", "Sterile Services Cleanroom Testing", "Theatre Validation Testing", "T-mat (Fluid control)", "Training (please specify…)", "Virusan (Antimicrobial Skin Sanitizer)", "Virusan AS (Antimicrobial Scrub)", "Virusolve+ (Cleaner, Sanitizer and Disinfectant)", "Workplace Exposure Monitoring", "Z-mop (Launderable Mop)", "Other (please specify...)"]
