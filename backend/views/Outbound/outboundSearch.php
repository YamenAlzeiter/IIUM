<?php

namespace backend\views\Outbound;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Outbound;

/**
 * outboundSearch represents the model behind the search form of `common\models\Outbound`.
 */
class outboundSearch extends Outbound
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ID', 'Status', 'Dean_ID', 'Person_in_charge_ID', 'Academic_current_semester', 'Academic_current_year', 'Financial_funded_accept', 'Type_mobility', 'credit_transfer_availability', 'host_scholarship', 'agreement'], 'integer'],
            [['Matric_Number', 'Name', 'Citizenship', 'Gender', 'Date_of_Birth', 'Passport_Number', 'Passport_Expiration', 'Mobile_Number', 'Email', 'Permanent_Address', 'Postcode', 'State', 'Country', 'Mailing_Address', 'Mailing_Postcode', 'Mailing_State', 'Mailing_Country', 'Note_dean', 'Note_hod', 'Emergency_name', 'Emergency_relationship', 'Emergency_phoneNumber', 'Emergency_email', 'Emergency_homeAddress', 'Emergency_postCode', 'Emergency_tate', 'Emergency_country', 'Academic_lvl_edu', 'Academic_kulliyyah', 'Academic_kulliyyah_others', 'Academic_name_of_programme ', 'Research', 'English_language_proficiency', 'Third_language', 'Sponsoring_name', 'Sponsoring_name_other', 'Type_mobility_program', 'Type_mobility_program_other', 'Host_university_name', 'Mobility_from', 'Mobility_until', 'Country_host_university', 'Connect_host_name', 'Connect_host_position', 'Connect_host_mobile_number', 'Connect_host_address', 'Connect_host_postcode', 'Connect_host_country', 'host_scholarship_amount', 'Offer_letter', 'Academic_transcript', 'Program_brochure', 'Latest_pay_slip', 'Other_latest_pay_slip', 'Proof_of_sponsorship', 'Proof_insurance_cover', 'Letter_of_indemnity', 'Flight_ticket', 'agreement_data', 'updated_at', 'created_at'], 'safe'],
            [['Academic_cgpa', 'English_result', 'Sponsoring_funding'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Outbound::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'ID' => $this->ID,
            'Status' => $this->Status,
            'Date_of_Birth' => $this->Date_of_Birth,
            'Passport_Expiration' => $this->Passport_Expiration,
            'Dean_ID' => $this->Dean_ID,
            'Person_in_charge_ID' => $this->Person_in_charge_ID,
            'Academic_current_semester' => $this->Academic_current_semester,
            'Academic_current_year' => $this->Academic_current_year,
            'Academic_cgpa' => $this->Academic_cgpa,
            'English_result' => $this->English_result,
            'Financial_funded_accept' => $this->Financial_funded_accept,
            'Sponsoring_funding' => $this->Sponsoring_funding,
            'Type_mobility' => $this->Type_mobility,
            'Mobility_from' => $this->Mobility_from,
            'Mobility_until' => $this->Mobility_until,
            'credit_transfer_availability' => $this->credit_transfer_availability,
            'host_scholarship' => $this->host_scholarship,
            'agreement_data' => $this->agreement_data,
            'agreement' => $this->agreement,
            'updated_at' => $this->updated_at,
            'created_at' => $this->created_at,
        ]);

        $query->andFilterWhere(['ilike', 'Matric_Number', $this->Matric_Number])
            ->andFilterWhere(['ilike', 'Name', $this->Name])
            ->andFilterWhere(['ilike', 'Citizenship', $this->Citizenship])
            ->andFilterWhere(['ilike', 'Gender', $this->Gender])
            ->andFilterWhere(['ilike', 'Passport_Number', $this->Passport_Number])
            ->andFilterWhere(['ilike', 'Mobile_Number', $this->Mobile_Number])
            ->andFilterWhere(['ilike', 'Email', $this->Email])
            ->andFilterWhere(['ilike', 'Permanent_Address', $this->Permanent_Address])
            ->andFilterWhere(['ilike', 'Postcode', $this->Postcode])
            ->andFilterWhere(['ilike', 'State', $this->State])
            ->andFilterWhere(['ilike', 'Country', $this->Country])
            ->andFilterWhere(['ilike', 'Mailing_Address', $this->Mailing_Address])
            ->andFilterWhere(['ilike', 'Mailing_Postcode', $this->Mailing_Postcode])
            ->andFilterWhere(['ilike', 'Mailing_State', $this->Mailing_State])
            ->andFilterWhere(['ilike', 'Mailing_Country', $this->Mailing_Country])
            ->andFilterWhere(['ilike', 'Note_dean', $this->Note_dean])
            ->andFilterWhere(['ilike', 'Note_hod', $this->Note_hod])
            ->andFilterWhere(['ilike', 'Emergency_name', $this->Emergency_name])
            ->andFilterWhere(['ilike', 'Emergency_relationship', $this->Emergency_relationship])
            ->andFilterWhere(['ilike', 'Emergency_phoneNumber', $this->Emergency_phoneNumber])
            ->andFilterWhere(['ilike', 'Emergency_email', $this->Emergency_email])
            ->andFilterWhere(['ilike', 'Emergency_homeAddress', $this->Emergency_homeAddress])
            ->andFilterWhere(['ilike', 'Emergency_postCode', $this->Emergency_postCode])
            ->andFilterWhere(['ilike', 'Emergency_tate', $this->Emergency_tate])
            ->andFilterWhere(['ilike', 'Emergency_country', $this->Emergency_country])
            ->andFilterWhere(['ilike', 'Academic_lvl_edu', $this->Academic_lvl_edu])
            ->andFilterWhere(['ilike', 'Academic_kulliyyah', $this->Academic_kulliyyah])
            ->andFilterWhere(['ilike', 'Academic_kulliyyah_others', $this->Academic_kulliyyah_others])
//            ->andFilterWhere(['ilike', 'Academic_name_of_programme ', $this->Academic_name_of_programme ])
            ->andFilterWhere(['ilike', 'Research', $this->Research])
            ->andFilterWhere(['ilike', 'English_language_proficiency', $this->English_language_proficiency])
            ->andFilterWhere(['ilike', 'Third_language', $this->Third_language])
            ->andFilterWhere(['ilike', 'Sponsoring_name', $this->Sponsoring_name])
            ->andFilterWhere(['ilike', 'Sponsoring_name_other', $this->Sponsoring_name_other])
            ->andFilterWhere(['ilike', 'Type_mobility_program', $this->Type_mobility_program])
            ->andFilterWhere(['ilike', 'Type_mobility_program_other', $this->Type_mobility_program_other])
            ->andFilterWhere(['ilike', 'Host_university_name', $this->Host_university_name])
            ->andFilterWhere(['ilike', 'Country_host_university', $this->Country_host_university])
            ->andFilterWhere(['ilike', 'Connect_host_name', $this->Connect_host_name])
            ->andFilterWhere(['ilike', 'Connect_host_position', $this->Connect_host_position])
            ->andFilterWhere(['ilike', 'Connect_host_mobile_number', $this->Connect_host_mobile_number])
            ->andFilterWhere(['ilike', 'Connect_host_address', $this->Connect_host_address])
            ->andFilterWhere(['ilike', 'Connect_host_postcode', $this->Connect_host_postcode])
            ->andFilterWhere(['ilike', 'Connect_host_country', $this->Connect_host_country])
            ->andFilterWhere(['ilike', 'host_scholarship_amount', $this->host_scholarship_amount])
            ->andFilterWhere(['ilike', 'Offer_letter', $this->Offer_letter])
            ->andFilterWhere(['ilike', 'Academic_transcript', $this->Academic_transcript])
            ->andFilterWhere(['ilike', 'Program_brochure', $this->Program_brochure])
            ->andFilterWhere(['ilike', 'Latest_pay_slip', $this->Latest_pay_slip])
            ->andFilterWhere(['ilike', 'Other_latest_pay_slip', $this->Other_latest_pay_slip])
            ->andFilterWhere(['ilike', 'Proof_of_sponsorship', $this->Proof_of_sponsorship])
            ->andFilterWhere(['ilike', 'Proof_insurance_cover', $this->Proof_insurance_cover])
            ->andFilterWhere(['ilike', 'Letter_of_indemnity', $this->Letter_of_indemnity])
            ->andFilterWhere(['ilike', 'Flight_ticket', $this->Flight_ticket]);

        return $dataProvider;
    }
}
