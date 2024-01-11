<?php

namespace backend\views\poc;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Poc;

/**
 * pocSearch represents the model behind the search form of `common\models\Poc`.
 */
class pocSearch extends Poc
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['name', 'email', 'email_cc', 'KCDIO', 'email_cc_additional', 'name_cc1', 'name_cc2'], 'safe'],
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
        $query = Poc::find();

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
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['ilike', 'name', $this->name])
            ->andFilterWhere(['ilike', 'email', $this->email])
            ->andFilterWhere(['ilike', 'email_cc', $this->email_cc])
            ->andFilterWhere(['ilike', 'KCDIO', $this->KCDIO])
            ->andFilterWhere(['ilike', 'email_cc_additional', $this->email_cc_additional])
            ->andFilterWhere(['ilike', 'name_cc1', $this->name_cc1])
            ->andFilterWhere(['ilike', 'name_cc2', $this->name_cc2]);

        return $dataProvider;
    }
}
