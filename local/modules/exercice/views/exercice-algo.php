<link rel="stylesheet" href="<?= WEBSITE_URL ?>/public/css/exercice.css">
<div class="body-content">
    <div class="container">
        <?php
            /**
             * Function that returns the index of the largest even value in the array.
             *
             * @param array array parameter which represents an array of values
             * 
             * @return int The index of the largest even value in the array.
             */
            $array = [17, 3, 87, 45, 27, 35, 72, 22, 93];

            function indexOfMaxPairValue($array){
                $maxPairNumber = null;
                $maxIndex = null;

                for ($i = 0; $i < count($array); $i++){
                    if ($array[$i] % 2 === 0){
                        if ($maxPairNumber === null || $maxPairNumber < $array[$i]){
                            $maxPairNumber = $array[$i];
                            $maxIndex = $i;
                        }
                    }
                }
                return $maxIndex;
            }

            $index = indexOfMaxPairValue($array);
            echo "L'index du nombre pair maximal dans mon tableau est: <strong>" .$index ."</strong>\n";
        ?>
    </div>
</div>
