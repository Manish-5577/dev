import { LightningElement, wire, track } from 'lwc';
import getchildenrolle from '@salesforce/apex/childenroleeauraenabled.getchildenrolle'
import upsertrec from '@salesforce/apex/pagination.upsertrec'
export default class Childenrolleelist extends LightningElement {

    @track childreclist
    recordMap = new Map();
    childrecobj = {
        Id: '',
        Name: '',
        testing__c: '',
        disable: false,
        uniqeid: '',
    }

    get options() {
        return [
            { label: 'one', value: 'one' },
            { label: 'two', value: 'two' },
            { label: 'three', value: 'three' },
        ];
    }


    @wire(getchildenrolle, {})
    getenrollerec({ data, error }) {
        if (data) {
            let response = JSON.parse(JSON.stringify(data))
            response.map(item => {
                item.disable = true;
                item.uniqeid = item.Id;
            });
            this.childreclist = response;
            console.log('this.childreclist', JSON.stringify(this.childreclist));
        }
        else if (error) {
            console.log('error line 17', error);
        }
    }

    handleClick(event) {
        console.log('line 2422', event.currentTarget.dataset.id);
        let recid = event.currentTarget.dataset.id;
        this.childreclist = this.childreclist.map((childrec) => {
            if (childrec.Id == recid) {
                return {
                    ...childrec,
                    disable: false
                }
            } console.log('line 522');
            return childrec;
        })
    }
    addrec() {
        const emptyrec = {
            ...this.childrecobj,   // ✅ clone
            uniqeid: Date.now().toString().slice(-10) // extra safety
        };
        this.childreclist = [emptyrec, ...this.childreclist];
    }
    handleChange(event) {
        let uniqueid = event.target.dataset.id;
        let uniqrecid = event.target.dataset.recid;
        console.log('unique id line 66', uniqueid);
        let name = event.target.name;
        if (this.recordMap.has(uniqueid)) {
            let childrec2 = this.recordMap.get(uniqueid);
            childrec2[name] = event.detail.value;
            childrec2.uniqeid = uniqueid;
            if (uniqrecid != '' && uniqrecid.length > 0) {
                childrec2.Id = uniqrecid;
            }
            console.log('line 75', JSON.stringify(childrec2));
            this.recordMap.set(uniqueid, childrec2)
        } else {
            const newrec = { ...this.childrecobj };
            // let newrec = this.childrecobj;// this will referemce same object 
             console.log('line 78');
            newrec[name] = event.detail.value;
            if (uniqrecid != '' && uniqrecid.length > 0) {
                newrec.Id = uniqrecid;
            } console.log('line 82');
            newrec.uniqeid = uniqueid;
            this.recordMap.set(uniqueid, newrec);
            console.log('line 85');
        }
        console.log('this.recordMap==>', JSON.stringify(this.recordMap));
    }
    saveall() {
        const payload = [...this.recordMap.values()].map(rec => {
            // Remove UI-only fields
            const { disable, uniqeid, ...cleanRec } = rec;
            // Remove Id only if it's empty
            if (!cleanRec.Id) {
                delete cleanRec.Id;
            }
            return cleanRec;
        });
console.log('payload', JSON.stringify(payload));
        upsertrec({ upsertlist: payload }).then((res) => {
            console.log('res==>', res);
        }).catch((error) => {
            console.log('error', error)
        })
    }
}