<?php

namespace frontend\views\Inbound;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Inbound;

/**
 * inboundSearch represents the model behind the search form of `common\models\Inbound`.
 */
class inboundSearch extends Inbound
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ID', 'Academic_current_semester', 'Academic_current_year', 'Academic_current_result', 'Mou_or_Moa', 'English_native', 'Propose_type_of_mobility', 'Propose_transfer_credit_hours', 'Financial_accommodation_on_campus', 'Financial_funding_sponsor_amount', 'Student_declaration_agreement', 'Status', 'Kulliyyah', 'msd_cps'], 'integer'],
            [['Name', 'Gender', 'Relation_ship', 'Date_of_Birth', 'Passport_Number', 'Passport_Expiration', 'Religion', 'Mazhab', 'Citizenship', 'Country_of_origin', 'Country_of_residence', 'Mobile_Number', 'Email_address', 'Permanent_Address', 'Postcode', 'Country', 'Emergency_name', 'Emergency_relationship', 'Emergency_phoneNumber', 'Emergency_email', 'Emergency_homeAddress', 'Emergency_postCode', 'Emergency_country', 'Academic_home_university', 'Academic_lvl_edu', 'Academic_name_of_programme', 'Academic_name_of_faculty', 'Research_title', 'English_test_name', 'English_certificate', 'Propose_type_of_programme', 'Propose_type_of_programme_other', 'Propose_kulliyyah_applied', 'Propose_duration_of_study', 'Propose_duration_start', 'Propose_duration_end', 'campus_location', 'Financial_funding', 'Sponsor_name', 'Financial_funding_other', 'Approval_university_person_name', 'Approval_person_position', 'Approval_person_email', 'Approval_person_mobile_number', 'Approval_date', 'Recommendation_letter', 'Student_declaration_name', 'Student_declaration_date', 'Passport', 'Latest_passport_photo', 'Latest_certified_academic_transcript', 'Confirmation_letter', 'Sponsorship_letter', 'note_kulliyyah', 'note_msd_cps', 'Token', 'created_at', 'updated_at', 'offer_letter', 'reference_number'], 'safe'],
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
        $query = Inbound::find();

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
            'Date_of_Birth' => $this->Date_of_Birth,
            'Passport_Expiration' => $this->Passport_Expiration,
            'Academic_current_semester' => $this->Academic_current_semester,
            'Academic_current_year' => $this->Academic_current_year,
            'Academic_current_result' => $this->Academic_current_result,
            'Mou_or_Moa' => $this->Mou_or_Moa,
            'English_native' => $this->English_native,
            'Propose_type_of_mobility' => $this->Propose_type_of_mobility,
            'Propose_duration_start' => $this->Propose_duration_start,
            'Propose_duration_end' => $this->Propose_duration_end,
            'Propose_transfer_credit_hours' => $this->Propose_transfer_credit_hours,
            'Financial_accommodation_on_campus' => $this->Financial_accommodation_on_campus,
            'Financial_funding_sponsor_amount' => $this->Financial_funding_sponsor_amount,
            'Approval_date' => $this->Approval_date,
            'Student_declaration_date' => $this->Student_declaration_date,
            'Student_declaration_agreement' => $this->Student_declaration_agreement,
            'Status' => $this->Status,
            'Kulliyyah' => $this->Kulliyyah,
            'msd_cps' => $this->msd_cps,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'Name', $this->Name])
            ->andFilterWhere(['like', 'Gender', $this->Gender])
            ->andFilterWhere(['like', 'Relation_ship', $this->Relation_ship])
            ->andFilterWhere(['like', 'Passport_Number', $this->Passport_Number])
            ->andFilterWhere(['like', 'Religion', $this->Religion])
            ->andFilterWhere(['like', 'Mazhab', $this->Mazhab])
            ->andFilterWhere(['like', 'Citizenship', $this->Citizenship])
            ->andFilterWhere(['like', 'Country_of_origin', $this->Country_of_origin])
            ->andFilterWhere(['like', 'Country_of_residence', $this->Country_of_residence])
            ->andFilterWhere(['like', 'Mobile_Number', $this->Mobile_Number])
            ->andFilterWhere(['like', 'Email_address', $this->Email_address])
            ->andFilterWhere(['like', 'Permanent_Address', $this->Permanent_Address])
            ->andFilterWhere(['like', 'Postcode', $this->Postcode])
            ->andFilterWhere(['like', 'Country', $this->Country])
            ->andFilterWhere(['like', 'Emergency_name', $this->Emergency_name])
            ->andFilterWhere(['like', 'Emergency_relationship', $this->Emergency_relationship])
            ->andFilterWhere(['like', 'Emergency_phoneNumber', $this->Emergency_phoneNumber])
            ->andFilterWhere(['like', 'Emergency_email', $this->Emergency_email])
            ->andFilterWhere(['like', 'Emergency_homeAddress', $this->Emergency_homeAddress])
            ->andFilterWhere(['like', 'Emergency_postCode', $this->Emergency_postCode])
            ->andFilterWhere(['like', 'Emergency_country', $this->Emergency_country])
            ->andFilterWhere(['like', 'Academic_home_university', $this->Academic_home_university])
            ->andFilterWhere(['like', 'Academic_lvl_edu', $this->Academic_lvl_edu])
            ->andFilterWhere(['like', 'Academic_name_of_programme', $this->Academic_name_of_programme])
            ->andFilterWhere(['like', 'Academic_name_of_faculty', $this->Academic_name_of_faculty])
            ->andFilterWhere(['like', 'Research_title', $this->Research_title])
            ->andFilterWhere(['like', 'English_test_name', $this->English_test_name])
            ->andFilterWhere(['like', 'English_certificate', $this->English_certificate])
            ->andFilterWhere(['like', 'Propose_type_of_programme', $this->Propose_type_of_programme])
            ->andFilterWhere(['like', 'Propose_type_of_programme_other', $this->Propose_type_of_programme_other])
            ->andFilterWhere(['like', 'Propose_kulliyyah_applied', $this->Propose_kulliyyah_applied])
            ->andFilterWhere(['like', 'Propose_duration_of_study', $this->Propose_duration_of_study])
            ->andFilterWhere(['like', 'campus_location', $this->campus_location])
            ->andFilterWhere(['like', 'Financial_funding', $this->Financial_funding])
            ->andFilterWhere(['like', 'Sponsor_name', $this->Sponsor_name])
            ->andFilterWhere(['like', 'Financial_funding_other', $this->Financial_funding_other])
            ->andFilterWhere(['like', 'Approval_university_person_name', $this->Approval_university_person_name])
            ->andFilterWhere(['like', 'Approval_person_position', $this->Approval_person_position])
            ->andFilterWhere(['like', 'Approval_person_email', $this->Approval_person_email])
            ->andFilterWhere(['like', 'Approval_person_mobile_number', $this->Approval_person_mobile_number])
            ->andFilterWhere(['like', 'Recommendation_letter', $this->Recommendation_letter])
            ->andFilterWhere(['like', 'Student_declaration_name', $this->Student_declaration_name])
            ->andFilterWhere(['like', 'Passport', $this->Passport])
            ->andFilterWhere(['like', 'Latest_passport_photo', $this->Latest_passport_photo])
            ->andFilterWhere(['like', 'Latest_certified_academic_transcript', $this->Latest_certified_academic_transcript])
            ->andFilterWhere(['like', 'Confirmation_letter', $this->Confirmation_letter])
            ->andFilterWhere(['like', 'Sponsorship_letter', $this->Sponsorship_letter])
            ->andFilterWhere(['like', 'note_kulliyyah', $this->note_kulliyyah])
            ->andFilterWhere(['like', 'note_msd_cps', $this->note_msd_cps])
            ->andFilterWhere(['like', 'Token', $this->Token])
            ->andFilterWhere(['like', 'offer_letter', $this->offer_letter])
            ->andFilterWhere(['like', 'reference_number', $this->reference_number]);

        return $dataProvider;
    }
}
