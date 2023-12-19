<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "inbound".
 *
 * @property int $ID
 * @property string $Name
 * @property string|null $Gender
 * @property string|null $Relation_ship
 * @property string|null $Date_of_Birth
 * @property string|null $Passport_Number
 * @property string|null $Passport_Expiration
 * @property string|null $Religion
 * @property string|null $Mazhab
 * @property string|null $Citizenship
 * @property string|null $Country_of_origin
 * @property string|null $Country_of_residence
 * @property string|null $Mobile_Number
 * @property string|null $Email_address
 * @property string|null $Permanent_Address
 * @property string|null $Postcode
 * @property string|null $Country
 * @property string|null $Emergency_name
 * @property string|null $Emergency_relationship
 * @property string|null $Emergency_phoneNumber
 * @property string|null $Emergency_email
 * @property string|null $Emergency_homeAddress
 * @property string|null $Emergency_postCode
 * @property string|null $Emergency_country
 * @property string|null $Academic_home_university
 * @property string|null $Academic_lvl_edu
 * @property string|null $Academic_name_of_programme
 * @property int|null $Academic_current_semester
 * @property int|null $Academic_current_year
 * @property string|null $Academic_name_of_faculty
 * @property int|null $Academic_current_result
 * @property string|null $Research_title
 * @property int|null $Mou_or_Moa
 * @property int|null $English_native
 * @property string|null $English_test_name
 * @property string|null $English_other_test_name
 * @property resource|null $English_certificate
 * @property string|null $Propose_type_of_programme
 * @property string|null $Propose_type_of_programme_other
 * @property int|null $Propose_type_of_mobility
 * @property string|null $Propose_kulliyyah_applied
 * @property string|null $Propose_duration_of_study
 * @property string|null $Propose_duration_start
 * @property string|null $Propose_duration_end
 * @property int|null $Propose_transfer_credit_hours
 * @property int|null $Financial_accommodation_on_campus
 * @property string|null $campus_location
 * @property string|null $Financial_funding
 * @property string|null $Sponsor_name
 * @property string|null $Room_type
 * @property int|null $Financial_funding_sponsor_amount
 * @property string|null $Financial_funding_other
 * @property string|null $Approval_university_person_name
 * @property string|null $Approval_person_position
 * @property string|null $Approval_person_email
 * @property string|null $Approval_person_mobile_number
 * @property string|null $Approval_date
 * @property resource|null $Recommendation_letter
 * @property string|null $Student_declaration_name
 * @property string|null $Student_declaration_date
 * @property int|null $Student_declaration_agreement
 * @property resource|null $Passport
 * @property resource|null $Latest_passport_photo
 * @property resource|null $Latest_certified_academic_transcript
 * @property resource|null $Confirmation_letter
 * @property resource|null $Sponsorship_letter
 * @property int|null $Status
 * @property int|null $Kulliyyah
 * @property int|null $msd_cps
 * @property string|null $note_kulliyyah
 * @property string|null $note_msd_cps
 * @property string|null $Token
 * @property string|null $updated_at
 * @property string|null $created_at
 * @property resource|null $offer_letter
 * @property string|null $reference_number
 * @property string|null $temp
 */
class Inbound extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */


    public static function tableName()
    {
        return 'inbound';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Date_of_Birth', 'Passport_Expiration', 'Propose_duration_start', 'Propose_duration_end', 'Approval_date', 'Student_declaration_date', 'updated_at', 'created_at'], 'safe'],
            [['Academic_current_semester', 'Academic_current_year', 'Academic_current_result', 'Mou_or_Moa', 'English_native', 'Propose_type_of_mobility', 'Propose_transfer_credit_hours', 'Financial_accommodation_on_campus', 'Financial_funding_sponsor_amount', 'Student_declaration_agreement', 'Status', 'Kulliyyah', 'msd_cps'], 'default', 'value' => null],
            [['Academic_current_semester', 'Academic_current_year', 'Academic_current_result', 'Mou_or_Moa', 'English_native', 'Propose_type_of_mobility', 'Propose_transfer_credit_hours', 'Financial_accommodation_on_campus', 'Financial_funding_sponsor_amount', 'Student_declaration_agreement', 'Status', 'Kulliyyah', 'msd_cps'], 'integer'],
            [['English_certificate', 'Recommendation_letter', 'Passport', 'Latest_passport_photo', 'Latest_certified_academic_transcript', 'Confirmation_letter', 'Sponsorship_letter', 'offer_letter'], 'file', 'extensions' => 'pdf'],
            [['Name', 'Permanent_Address', 'Emergency_relationship'], 'string', 'max' => 255],
            [['Gender'], 'string', 'max' => 1],
            [['Relation_ship', 'Postcode', 'Emergency_postCode'], 'string', 'max' => 10],
            [['Passport_Number'], 'string', 'max' => 9],
            [['Religion', 'Mazhab', 'Country_of_origin', 'Country_of_residence', 'Country', 'Emergency_country', 'Sponsor_name', 'Room_type', 'reference_number'], 'string', 'max' => 100],
            [['Citizenship'], 'string', 'max' => 2],
            [['Mobile_Number', 'Emergency_phoneNumber'], 'string', 'max' => 15],
            [['Email_address', 'Emergency_name', 'Emergency_email', 'Emergency_homeAddress', 'Academic_home_university', 'Academic_name_of_programme', 'Academic_name_of_faculty', 'Research_title', 'English_test_name', 'English_other_test_name', 'Propose_type_of_programme', 'Propose_type_of_programme_other', 'Propose_kulliyyah_applied', 'campus_location', 'Financial_funding_other', 'Approval_university_person_name', 'Approval_person_position', 'Approval_person_email', 'Student_declaration_name', 'note_kulliyyah', 'note_msd_cps', 'Token'], 'string', 'max' => 512],
            [['Academic_lvl_edu'], 'string', 'max' => 20],
            [['Propose_duration_of_study', 'Financial_funding'], 'string', 'max' => 30],
            [['Approval_person_mobile_number'], 'string', 'max' => 16],
            [['Email_address'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Name' => 'Name',
            'Gender' => 'Gender',
            'Relation_ship' => 'Relation Ship',
            'Date_of_Birth' => 'Date Of Birth',
            'Passport_Number' => 'Passport Number',
            'Passport_Expiration' => 'Passport Expiration',
            'Religion' => 'Religion',
            'Mazhab' => 'Mazhab',
            'Citizenship' => 'Citizenship',
            'Country_of_origin' => 'Country Of Origin',
            'Country_of_residence' => 'Country Of Residence',
            'Mobile_Number' => 'Mobile Number',
            'Email_address' => 'Email Address',
            'Permanent_Address' => 'Permanent Address',
            'Postcode' => 'Postcode',
            'Country' => 'Country',
            'Emergency_name' => 'Emergency Name',
            'Emergency_relationship' => 'Emergency Relationship',
            'Emergency_phoneNumber' => 'Emergency Phone Number',
            'Emergency_email' => 'Emergency Email',
            'Emergency_homeAddress' => 'Emergency Home Address',
            'Emergency_postCode' => 'Emergency Post Code',
            'Emergency_country' => 'Emergency Country',
            'Academic_home_university' => 'Academic Home University',
            'Academic_lvl_edu' => 'Academic Lvl Edu',
            'Academic_name_of_programme' => 'Academic Name Of Programme',
            'Academic_current_semester' => 'Academic Current Semester',
            'Academic_current_year' => 'Academic Current Year',
            'Academic_name_of_faculty' => 'Academic Name Of Faculty',
            'Academic_current_result' => 'Academic Current Result',
            'Research_title' => 'Research Title',
            'Mou_or_Moa' => 'Mou Or Moa',
            'English_native' => 'English Native',
            'English_test_name' => 'English Test Name',
            'English_other_test_name' => 'English Other Test Name',
            'English_certificate' => 'English Certificate',
            'Propose_type_of_programme' => 'Propose Type Of Programme',
            'Propose_type_of_programme_other' => 'Propose Type Of Programme Other',
            'Propose_type_of_mobility' => 'Propose Type Of Mobility',
            'Propose_kulliyyah_applied' => 'Propose Kulliyyah Applied',
            'Propose_duration_of_study' => 'Propose Duration Of Study',
            'Propose_duration_start' => 'Propose Duration Start',
            'Propose_duration_end' => 'Propose Duration End',
            'Propose_transfer_credit_hours' => 'Propose Transfer Credit Hours',
            'Financial_accommodation_on_campus' => 'Financial Accommodation On Campus',
            'campus_location' => 'Campus Location',
            'Financial_funding' => 'Financial Funding',
            'Sponsor_name' => 'Sponsor Name',
            'Room_type' => 'Room Type',
            'Financial_funding_sponsor_amount' => 'Financial Funding Sponsor Amount',
            'Financial_funding_other' => 'Financial Funding Other',
            'Approval_university_person_name' => 'Approval University Person Name',
            'Approval_person_position' => 'Approval Person Position',
            'Approval_person_email' => 'Approval Person Email',
            'Approval_person_mobile_number' => 'Approval Person Mobile Number',
            'Approval_date' => 'Approval Date',
            'Recommendation_letter' => 'Recommendation Letter',
            'Student_declaration_name' => 'Student Declaration Name',
            'Student_declaration_date' => 'Student Declaration Date',
            'Student_declaration_agreement' => 'Student Declaration Agreement',
            'Passport' => 'Passport',
            'Latest_passport_photo' => 'Latest Passport Photo',
            'Latest_certified_academic_transcript' => 'Latest Certified Academic Transcript',
            'Confirmation_letter' => 'Confirmation Letter',
            'Sponsorship_letter' => 'Sponsorship Letter',
            'Status' => 'Status',
            'Kulliyyah' => 'Kulliyyah',
            'msd_cps' => 'Msd Cps',
            'note_kulliyyah' => 'Note Kulliyyah',
            'note_msd_cps' => 'Note Msd Cps',
            'Token' => 'Token',
            'updated_at' => 'Updated At',
            'created_at' => 'Created At',
            'offer_letter' => 'Offer Letter',
            'reference_number' => 'Reference Number',
        ];
    }
    public function afterSave($insert, $changedAttributes)
    {
//        parent::afterSave($insert, $changedAttributes);
//
//        if (!$insert && isset($changedAttributes['Status'])) {
//            // Log the status change
//            $this->createStatusLog($changedAttributes['Status'], $this->Status);
//        }
        parent::afterSave($insert, $changedAttributes);

        if (!$insert) {
            $oldStatus = $changedAttributes['Status'];
            $newStatus = $this->Status;

            if ($oldStatus !== $newStatus) {
                if(($oldStatus === 16 && $newStatus === 5) || ($oldStatus === 36 && $newStatus === 25)){
                    $this->createStatusLog($oldStatus, $newStatus, $this->temp);
                }
                elseif (($oldStatus === 5 && $newStatus === 16)){
                    $this->createStatusLog($oldStatus, $newStatus, $this->note_kulliyyah);
                }
                elseif (($oldStatus === 25 && $newStatus === 36)){
                    $this->createStatusLog($oldStatus, $newStatus, $this->note_msd_cps);
                }
                else
                    $this->createStatusLog($oldStatus, $newStatus, null);
            }
        }
    }

    /**
     * Create a log entry for status change.
     *
     * @param int $oldStatus
     * @param int $newStatus
     */
    protected function createStatusLog($oldStatus, $newStatus, $message)
    {
        $log = new Inlog();
        $log->outbound_id = $this->ID;
        $log->old_status = $oldStatus;
        $log->new_status = $newStatus;
        $log->message = $message;
        $log->save();
    }
}
