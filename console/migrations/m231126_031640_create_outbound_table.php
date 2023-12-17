<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%outbound}}`.
 */
class m231126_031640_create_outbound_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%outbound}}', [

            //personal Info\\
            'ID' => $this->primaryKey(),
            'Status' => $this->integer(1),
            'Matric_Number' => $this->string(15),
            'Name' => $this->string(255),
            'Citizenship' => $this->char(2),
            'Gender' => $this->char(1),
            'Date_of_Birth' => $this->date(),
            'Passport_Number' => $this->string(15),
            'Passport_Expiration' => $this->date(),
            'Mobile_Number' => $this->string(15),
            'Email' => $this->string(512),
            'Permanent_Address' => $this->string(255),
            'Postcode' => $this->string(10),
            'State' => $this->string(100),
            'Country' => $this->string(100),
            'Mailing_Address' => $this->string(255),
            'Mailing_Postcode' => $this->string(10),
            'Mailing_State' => $this->string(100),
            'Mailing_Country' => $this->string(100),

            //redirected Info\\
            'Dean_ID' => $this -> integer(1),
            'Person_in_charge_ID' => $this -> integer(1),
            'Note_dean' => $this -> string(512),
            'Note_hod' => $this -> string(512),

            //Emergency contact\\
            'Emergency_name' => $this  ->string(512),
            'Emergency_relationship' => $this->string(512),
            'Emergency_phoneNumber' => $this ->string(15),
            'Emergency_email' => $this -> string(512),
            'Emergency_homeAddress' => $this ->string(512),
            'Emergency_postCode' => $this -> string(10),
            'Emergency_tate' => $this->string(100),
            'Emergency_country' => $this->string(100),

            //Academic Info\\
            'Academic_lvl_edu' => $this ->char(2),
            'Academic_kulliyyah' =>$this -> string(512),
            'Academic_kulliyyah_others' => $this ->  string(512),
            'Academic_current_semester' =>$this -> integer(1),
            'Academic_current_year' => $this -> integer(1),
            'Academic_name_of_programme' => $this ->  string(512),
            'Academic_cgpa' => $this -> float(4),
            'Research' => $this -> string(512),

            //English Info\\
            'English_language_proficiency' => $this -> string(60),
            "English_result" => $this ->float(4),
            'Third_language'=> $this->string(25),

            //Financial Info\\
            'Financial_funded_accept' => $this->integer(1),
            'Sponsoring_name' => $this->string(512),
            'Sponsoring_name_other' => $this->string(512),
            'Sponsoring_funding' => $this->float(6),

            //Mobility\\
            'Type_mobility' => $this->integer(1),
            'Type_mobility_program' => $this->string(512),
            'Type_mobility_program_other' => $this->string(512),
            
            //Host University Info\\
            'Host_university_name' => $this->string(512),
            'Mobility_from' => $this->date(),
            'Mobility_until' =>$this->date(),
            'Country_host_university' => $this->string(100),
            'credit_transfer_availability' => $this->integer(1),

            //Host University Connect Info\\
            'Connect_host_name'=>$this->string(100),
            'Connect_host_position'=>$this->string(100),
            'Connect_host_mobile_number'=>$this->string(19),
            'Connect_host_address' =>$this->string(512),
            'Connect_host_postcode' => $this->string(10),
            'Connect_host_country' => $this->string(100),

            //Host University Scholarship\\
            'host_scholarship' => $this->integer(1),
            'host_scholarship_amount' => $this->string(9),

            //File To Upload\\
            'Offer_letter' => $this->binary(),
            'Academic_transcript' => $this->binary(),
            'Program_brochure' => $this->binary(),
            'Latest_pay_slip' => $this->binary(),
            'Other_latest_pay_slip'=> $this->binary(),
            'Proof_of_sponsorship' =>$this->binary(),
            'Proof_insurance_cover' =>$this->binary(),
            'Letter_of_indemnity' => $this->binary(),
            'Flight_ticket'=>$this->binary(),

            //Agreement\\
            'agreement_data' => $this->date(),
            'agreement' =>$this->integer(1),

            //Creation and Update Dates\\
            'updated_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),
            'created_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),


        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%outbound}}');
    }
}
