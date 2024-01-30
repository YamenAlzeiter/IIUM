<?php
use common\models\Countries;
use common\models\States;
use yii\web\Controller;

/**
 * CountriesController handles AJAX requests related to countries and states.
 */
class CountryiesController extends Controller
{

    /**
     * Retrieves a list of countries.
     * @return string the HTML options for countries
     */
    public function actionGetCountries()
    {
        $countries = Countries::find()->all();
        $options = '<option value="">Select Country</option>';
        foreach ($countries as $country) {
            $options .= '<option value="'.$country->id.'">'.$country->name.'</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }
    /**
     * Retrieves a list of nationalities based on countries.
     * @return string the HTML options for nationalities
     */
    public function actionGetNationality()
    {
        $countries = Countries::find()->all();
        $options = '<option value="">Select Nationality</option>';
        foreach ($countries as $country) {
            $options .= '<option value="'.$country->nationality.'">'.$country->nationality.'</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }
    /**
     * Retrieves a list of states based on the selected country.
     * @return string the HTML options for states
     */
    public function actionGetStates()
    {
        $countryId = Yii::$app->request->post('countryId');
        $states = States::find()->where(['country_id' => $countryId])->all();

        $options = '<option value="">Select State</option>';
        foreach ($states as $state) {
            $options .= '<option value="'.$state->id.'">'.$state->name.'</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }
}


