<?php
use common\models\Countries;
use common\models\States;
use yii\web\Controller;
class CountryiesController extends Controller
{
    public function actionGetCountries()
    {
        $countries = Countries::find()->all(); // Replace YourCountryModel with your actual model class name
        $options = '<option value="">Select Country</option>';
        foreach ($countries as $country) {
            $options .= '<option value="'.$country->id.'">'.$country->name.'</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }

    public function actionGetNationality()
    {
        $countries = Countries::find()->all(); // Replace YourCountryModel with your actual model class name
        $options = '<option value="">Select Nationality</option>';
        foreach ($countries as $country) {
            $options .= '<option value="'.$country->nationality.'">'.$country->nationality.'</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }

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


