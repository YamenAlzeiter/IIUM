<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\db\Expression;


/**
 * This is the model class for table "outbound".
 *
 * @property int $ID
 * @property int|null $Status
 * @property string|null $Matric_Number
 * @property string|null $Name
 * @property string|null $Citizenship
 * @property string|null $Gender
 * @property string|null $Date_of_Birth
 * @property string|null $Passport_Number
 * @property string|null $Passport_Expiration
 * @property string|null $Mobile_Number
 * @property string|null $Email
 * @property string|null $Permanent_Address
 * @property string|null $Postcode
 * @property string|null $State
 * @property string|null $Country
 * @property string|null $Mailing_Address
 * @property string|null $Mailing_Postcode
 * @property string|null $Mailing_State
 * @property string|null $Mailing_Country
 * @property int|null $Dean_ID
 * @property int|null $Person_in_charge_ID
 * @property string|null $Note_dean
 * @property string|null $Note_hod
 * @property string|null $Emergency_name
 * @property string|null $Emergency_relationship
 * @property string|null $Emergency_phoneNumber
 * @property string|null $Emergency_email
 * @property string|null $Emergency_homeAddress
 * @property string|null $Emergency_postCode
 * @property string|null $Emergency_tate
 * @property string|null $Emergency_country
 * @property string|null $Academic_lvl_edu
 * @property string|null $Academic_kulliyyah
 * @property string|null $Academic_kulliyyah_others
 * @property int|null $Academic_current_semester
 * @property int|null $Academic_current_year
 * @property string|null $Academic_name_of_programme
 * @property float|null $Academic_cgpa
 * @property string|null $Research
 * @property string|null $English_language_proficiency
 * @property float|null $English_result
 * @property string|null $Third_language
 * @property int|null $Financial_funded_accept
 * @property string|null $Sponsoring_name
 * @property string|null $Sponsoring_name_other
 * @property float|null $Sponsoring_funding
 * @property int|null $Type_mobility
 * @property string|null $Type_mobility_program
 * @property string|null $Type_mobility_program_other
 * @property string|null $Host_university_name
 * @property string|null $Mobility_from
 * @property string|null $Mobility_until
 * @property string|null $Country_host_university
 * @property int|null $credit_transfer_availability
 * @property string|null $Connect_host_name
 * @property string|null $Connect_host_position
 * @property string|null $Connect_host_mobile_number
 * @property string|null $Connect_host_address
 * @property string|null $Connect_host_postcode
 * @property string|null $Connect_host_country
 * @property int|null $host_scholarship
 * @property string|null $host_scholarship_amount
 * @property resource|null $Offer_letter
 * @property resource|null $Academic_transcript
 * @property resource|null $Program_brochure
 * @property resource|null $Latest_pay_slip
 * @property resource|null $Other_latest_pay_slip
 * @property resource|null $Proof_of_sponsorship
 * @property resource|null $Proof_insurance_cover
 * @property resource|null $Letter_of_indemnity
 * @property resource|null $Flight_ticket
 * @property string|null $agreement_data
 * @property int|null $agreement
 * @property string|null $updated_at
 * @property string|null $created_at
 * @property string|null $Token
 * @property string|null $Connect_host_email
 * @property Courses[] $courses
 * @property Iiumcourse[] $iiumcourses
 * @property string|null $temp
 * @property string|null $driveLink
 *
 */
class Outbound extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'outbound';
    }




    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [
                [
                     'Name', 'Citizenship', 'Gender', 'Date_of_Birth', 'Passport_Number',
                    'Passport_Expiration', 'Mobile_Number', 'Email', 'Permanent_Address', 'Country', 'State',
                    'Postcode', 'Emergency_name', 'Emergency_relationship', 'Emergency_phoneNumber', 'Emergency_email',
                    'Emergency_homeAddress', 'Emergency_country', 'Emergency_tate', 'Emergency_postCode',
                    'Academic_lvl_edu', 'Academic_kulliyyah', 'Academic_current_semester', 'Academic_current_year',
                    'Academic_name_of_programme', 'Academic_cgpa', 'English_language_proficiency', 'English_result',
                    'Financial_funded_accept', 'Sponsoring_name', 'Sponsoring_funding', 'Type_mobility',
                    'Type_mobility_program', 'Country_host_university', 'Host_university_name', 'Mobility_from',
                    'Mobility_until', 'credit_transfer_availability', 'Connect_host_name', 'Connect_host_position',
                    'Connect_host_mobile_number', 'Connect_host_email', 'Connect_host_address', 'Connect_host_country',
                    'Connect_host_postcode'

                ], 'required', 'on' => 'requiredValidate'
            ], [
                'Academic_kulliyyah_others', 'required', 'when' => function ($model) {
                    return $model->Academic_kulliyyah === 'Other';
                }
            ], [
                'Third_language', 'required', 'when' => function ($model) {
                    return $model->English_language_proficiency === 'Other';
                }
            ], [
                'Sponsoring_name_other', 'required', 'when' => function ($model) {
                    return $model->Sponsoring_name === 'Other';
                }
            ], [
                'Type_mobility_program_other', 'required', 'when' => function ($model) {
                    return $model->Type_mobility_program === 'Other';
                }
            ],[
                'Research', 'required', 'when' => function ($model) {
                    return $model->Academic_lvl_edu === 'PG';
                }
            ],[
                ['agreement'], 'required', 'requiredValue' => 1, 'message' => 'You must agree to the terms and conditions'
            ],
            [['Offer_letter', 'Academic_transcript', 'Program_brochure', 'Latest_pay_slip', 'Other_latest_pay_slip'], 'required', 'on'=>'create'],

            [['Email', 'Emergency_email'], 'email'],
            [['Academic_cgpa', 'English_result', 'Sponsoring_funding'], 'number'],
            ['Mobility_until', 'compare', 'compareAttribute' => 'Mobility_from', 'operator' => '>', 'enableClientValidation' => false],
            [['Status', 'Dean_ID', 'Person_in_charge_ID', 'Academic_current_semester', 'Academic_current_year', 'Financial_funded_accept', 'Type_mobility', 'credit_transfer_availability', 'host_scholarship', 'agreement'], 'default', 'value' => null],
            [['Status', 'Dean_ID', 'Person_in_charge_ID', 'Academic_current_semester', 'Academic_current_year', 'Financial_funded_accept', 'Type_mobility', 'credit_transfer_availability', 'host_scholarship'], 'integer'],
            [['Date_of_Birth', 'Passport_Expiration', 'Mobility_from', 'Mobility_until', 'agreement_data', 'updated_at', 'created_at'], 'safe'],

            [['Offer_letter', 'Academic_transcript', 'Program_brochure', 'Latest_pay_slip', 'Other_latest_pay_slip', 'Proof_of_sponsorship', 'Proof_insurance_cover', 'Letter_of_indemnity', 'Flight_ticket'], 'file', 'extensions' => 'pdf'],

            [['Matric_Number', 'Passport_Number', 'Mobile_Number', 'Emergency_phoneNumber'], 'string', 'max' => 15],

            [['Name', 'Permanent_Address', 'Mailing_Address','driveLink'], 'string', 'max' => 255],

            [['Citizenship', 'Email', 'Emergency_name', 'Emergency_relationship', 'Emergency_email', 'Emergency_homeAddress', 'Academic_kulliyyah', 'Academic_kulliyyah_others', 'Academic_name_of_programme', 'Research', 'Sponsoring_name', 'Sponsoring_name_other', 'Type_mobility_program', 'Type_mobility_program_other', 'Host_university_name', 'Connect_host_address', 'Token', 'Connect_host_email'], 'string', 'max' => 512],
            [['Gender'], 'string', 'max' => 1],
            [['Postcode', 'Mailing_Postcode', 'Emergency_postCode', 'Connect_host_postcode'], 'string', 'max' => 10],
            [['State', 'Country', 'Mailing_State', 'Mailing_Country', 'Emergency_tate', 'Emergency_country', 'Country_host_university', 'Connect_host_name', 'Connect_host_position', 'Connect_host_country'], 'string', 'max' => 100],
            [['Academic_lvl_edu'], 'string', 'max' => 2],
            [['English_language_proficiency'], 'string', 'max' => 60],
            [['Third_language'], 'string', 'max' => 25],
            [['Connect_host_mobile_number'], 'string', 'max' => 19],
            [['host_scholarship_amount'], 'string', 'max' => 9],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Status' => 'Status',
            'Matric_Number' => 'Matric Number',
            'Name' => 'Name',
            'Citizenship' => 'Citizenship',
            'Gender' => 'Gender',
            'Date_of_Birth' => 'Date Of Birth',
            'Passport_Number' => 'Passport Number',
            'Passport_Expiration' => 'Passport Expiration',
            'Mobile_Number' => 'Mobile Number',
            'Email' => 'Email',
            'Permanent_Address' => 'Permanent Address',
            'Postcode' => 'Postcode',
            'State' => 'State',
            'Country' => 'Country',
            'Mailing_Address' => 'Mailing Address',
            'Mailing_Postcode' => 'Mailing Postcode',
            'Mailing_State' => 'Mailing State',
            'Mailing_Country' => 'Mailing Country',
            'Dean_ID' => 'Dean ID',
            'Person_in_charge_ID' => 'Person In Charge ID',
            'Note_dean' => 'Note Dean',
            'Note_hod' => 'Note Hod',
            'Emergency_name' => 'Name',
            'Emergency_relationship' => 'Relationship',
            'Emergency_phoneNumber' => 'Phone Number',
            'Emergency_email' => 'Email',
            'Emergency_homeAddress' => 'Home Address',
            'Emergency_postCode' => 'Post Code',
            'Emergency_tate' => 'State',
            'Emergency_country' => 'Country',
            'Academic_lvl_edu' => 'Academic Level of Education',
            'Academic_kulliyyah' => 'Kulliyyah',
            'Academic_kulliyyah_others' => 'Others (Please Specify)',
            'Academic_current_semester' => 'Current Semester',
            'Academic_current_year' => 'Current Year',
            'Academic_name_of_programme' => 'Name of Programme',
            'Academic_cgpa' => 'Academic Cgpa',
            'Research' => 'Research',
            'English_language_proficiency' => 'English Language Proficiency',
            'English_result' => 'English Result',
            'Third_language' => 'Third Language (Please Specify)',
            'Financial_funded_accept' => 'Financial Funded',
            'Sponsoring_name' => 'Name of Sponsoring Body',
            'Sponsoring_name_other' => 'Other (Please Specify)',
            'Sponsoring_funding' => 'Sponsoring Funding',
            'Type_mobility' => 'Type of  Mobility',
            'Type_mobility_program' => 'Mobility of Program',
            'Type_mobility_program_other' => 'Other (Please Specify)',
            'Host_university_name' => 'Name of Host University',
            'Mobility_from' => 'Mobility From',
            'Mobility_until' => 'Mobility Until',
            'Country_host_university' => 'Country Host University',
            'credit_transfer_availability' => 'Credit Transfer',
            'Connect_host_name' => 'Name',
            'Connect_host_position' => 'Position',
            'Connect_host_mobile_number' => 'Mobile Number',
            'Connect_host_address' => 'Address',
            'Connect_host_postcode' => 'Postcode',
            'Connect_host_country' => 'Country',
            'host_scholarship' => 'Host Scholarship',
            'host_scholarship_amount' => 'Host Scholarship Amount',
            'Offer_letter' => 'Offer Letter:',
            'Academic_transcript' => 'Academic Transcript: ',
            'Program_brochure' => 'Program Brochure: ',
            'Latest_pay_slip' => 'Latest Payment Slip: ',
            'Other_latest_pay_slip' => 'Other Latest Payment Slip:',
            'Proof_of_sponsorship' => 'Proof Of Sponsorship',
            'Proof_insurance_cover' => 'Proof Insurance Cover',
            'Letter_of_indemnity' => 'Letter Of Indemnity',
            'Flight_ticket' => 'Flight Ticket',
            'agreement_data' => 'Agreement Data',
            'agreement' => 'Agreement',
            'updated_at' => 'Updated At',
            'created_at' => 'Created At',
            'Token' => 'Token',
            'Connect_host_email' => 'Email Address'
        ];
    }



    public function getOutboundFiles()
    {
        return $this->hasMany(OutFiles::class, ['Student_ID' => 'ID']);
    }
    public function beforeSave($insert)
    {
        if($this->Matric_Number == null || $this->Matric_Number == ""){
            $this->Matric_Number = Yii::$app->user->identity->matric_number;
        }
        if($this->isAttributeChanged('Status') || $this->isNewRecord){
            $this->updated_at = new Expression('NOW()');

        }
        return parent::beforeSave($insert);
    }
    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);
        $newStatus = $this->Status;
        if ($this->Status == 10){
            if ($changedAttributes['Status'] == 3){

                $this->createStatusLog(0, $this->Status, "Application has been resubmitted");
            }
            else
                $this->createStatusLog(0, $this->Status, "Application has been submitted");
        }
        elseif (!$insert && isset($changedAttributes['Status'])) {
            $oldStatus = $changedAttributes['Status'];
            if($newStatus === 10){
                $this->createStatusLog("", $newStatus, $this->temp);
            }
            if ($oldStatus !== $newStatus) {
                if(($oldStatus === 12 && $newStatus === 1) ||
                    ($oldStatus === 32 && $newStatus === 21) ||
                    $newStatus === 3 ||
                    $newStatus === 2 ||
                    ($oldStatus === 51 && $newStatus === 41)){
                    $this->createStatusLog($oldStatus, $newStatus, $this->temp);
                } elseif (($oldStatus === 1 && $newStatus === 12)){
                    $this->createStatusLog($oldStatus, $newStatus, $this->Note_hod);
                }
                elseif (($oldStatus === 21 && $newStatus === 32)){
                    $this->createStatusLog($oldStatus, $newStatus, $this->Note_dean);
                }
                else {
                    $this->createStatusLog($oldStatus, $newStatus, null);
                }
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
        $log = new Log();
        $log->outbound_id = $this->ID;
        $log->old_status = $oldStatus;
        $log->new_status = $newStatus;
        $log->message = $message;
        $log->save();
    }
}

