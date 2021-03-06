. "$psscriptroot\Scoop-TestLib.ps1"
. "$psscriptroot\..\lib\versions.ps1"

describe "versions" {
    it 'compares versions with integer-string mismatch' {
        $a = '1.8.9'
        $b = '1.8.5-1'
        $res = compare_versions $a $b

        $res | should be 1
    }

    it 'handles plain string version comparison to int version' {
        $a = 'latest'
        $b = '20150405'
        $res = compare_versions $a $b

        $res | should be 1
    }

    it 'handles dashed version components' {
        $a = '7.0.4-9'
        $b = '7.0.4-10'

        $res = compare_versions $a $b

        $res | should be -1
    }
}
