<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%inbound}}`.
 */
class m231126_030545_create_inbound_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%inbound}}', [
            'ID' => $this->primaryKey(), 'Name' => $this->string(255)->notNull(), 'Gender' => $this->char(1),
            'Relation_ship' => $this->string(10), 'Date_of_Birth' => $this->date(),
            'Passport_Number' => $this->string(9), 'Passport_Expiration' => $this->date(),
            'Religion' => $this->string(100), 'Mazhab' => $this->string(100), 'Citizenship' => $this->char(2),
            'Country_of_origin' => $this->string(100), 'Country_of_residence' => $this->string(100),
            'Mobile_Number' => $this->string(15), 'Email_address' => $this->string(512)->unique(),
            'Permanent_Address' => $this->string(255), 'Postcode' => $this->string(10), 'Country' => $this->string(100),


            'Emergency_name' => $this->string(512), 'Emergency_relationship' => $this->string(255),
            'Emergency_phoneNumber' => $this->string(15), 'Emergency_email' => $this->string(512),
            'Emergency_homeAddress' => $this->string(512), 'Emergency_postCode' => $this->string(10),
            'Emergency_country' => $this->string(100),


            'Academic_home_university' => $this->string(512), 'Academic_lvl_edu' => $this->string(20),
            'Academic_name_of_programme' => $this->string(512), 'Academic_current_semester' => $this->integer(1),
            'Academic_current_year' => $this->integer(1), 'Academic_name_of_faculty' => $this->string(512),
            'Academic_current_result' => $this->integer(4), 'Research_title' => $this->string(512),
            'Mou_or_Moa' => $this->integer(1),


            'English_native' => $this->integer(1), 'English_test_name' => $this->string(512), 'English_other_test_name' => $this->string(512),
            'English_certificate' => $this->binary(),


            'Propose_type_of_programme' => $this->string(512), 'Propose_type_of_programme_other' => $this->string(512),
            'Propose_type_of_mobility' => $this->integer(2), 'Propose_kulliyyah_applied' => $this->string(512),
            'Propose_duration_of_study' => $this->string(30), 'Propose_duration_start' => $this->date(),
            'Propose_duration_end' => $this->date(), 'Propose_transfer_credit_hours' => $this->integer(1),


            'Financial_accommodation_on_campus' => $this->integer(1), 'campus_location' => $this->string(512),
            'Financial_funding' => $this->string(30), 'Sponsor_name' => $this->string(100),
            'Room_type' => $this->string(100), 'Financial_funding_sponsor_amount' => $this->integer(7),
            'Financial_funding_other' => $this->string(512),


            'Approval_university_person_name' => $this->string(512), 'Approval_person_position' => $this->string(512),
            'Approval_person_email' => $this->string(512), 'Approval_person_mobile_number' => $this->string(16),
            'Approval_date' => $this->date(), 'Recommendation_letter' => $this->binary(),


            'Student_declaration_name' => $this->string(512), 'Student_declaration_date' => $this->date(),
            'Student_declaration_agreement' => $this->integer(1),


            'Passport' => $this->binary(), 'Latest_passport_photo' => $this->binary(),
            'Latest_certified_academic_transcript' => $this->binary(), 'Confirmation_letter' => $this->binary(),
            'Sponsorship_letter' => $this->binary(),


            'Status' => $this->integer(1), 'Kulliyyah' => $this->integer(1), 'msd_cps' => $this->integer(1),
            'note_kulliyyah' => $this->string(512), 'note_msd_cps' => $this->string(512), 'Token' => $this->string(512),

            'updated_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),
            'created_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),


            'offer_letter' => $this->binary(), 'reference_number' => $this->string(100),

        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%inbound}}');
    }
}
